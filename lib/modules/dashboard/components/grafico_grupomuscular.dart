import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:gym_rats/models/grupoMuscularGrafico.dart';
import 'package:gym_rats/models/usuariosModel.dart';

class GraficoGrupoMuscular extends StatefulWidget {
  @override
  _GraficoGrupoMuscularState createState() {
    return _GraficoGrupoMuscularState();
  }
}

class _GraficoGrupoMuscularState extends State<GraficoGrupoMuscular> {
  List<charts.Series<GruposMuscularesGrafico, String>> _seriesPieData;
  List<GruposMuscularesGrafico> mydata;
  _generateData(mydata) {
    List<charts.Series<GruposMuscularesGrafico, String>> _seriesPieData;
    _seriesPieData.add(
      charts.Series(
        domainFn: (GruposMuscularesGrafico musculo, _) => musculo.nome,
        measureFn: (GruposMuscularesGrafico musculo, _) => musculo.quantidade,
        id: 'grupoMuscular',
        data: mydata,
        labelAccessorFn: (GruposMuscularesGrafico row, _) =>
            "${row.quantidade}",
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('grupoMuscular')),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance
          .collection('users')
          .document(Usuario.of(context).firebaseUser.uid)
          .collection('grupoMuscular')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LinearProgressIndicator();
        } else {
          List<GruposMuscularesGrafico> musculos = snapshot.data.documents
              .map((documentSnapshot) => GruposMuscularesGrafico.fromMap(
                  documentSnapshot.data, documentSnapshot.documentID))
              .toList();
          return _buildChart(context, musculos);
        }
      },
    );
  }

  Widget _buildChart(
      BuildContext context, List<GruposMuscularesGrafico> taskdata) {
    mydata = taskdata;
    _generateData(mydata);
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                'Grupos Musculares',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: charts.PieChart(_seriesPieData,
                    animate: true,
                    animationDuration: Duration(seconds: 5),
                    behaviors: [
                      new charts.DatumLegend(
                        outsideJustification:
                            charts.OutsideJustification.endDrawArea,
                        horizontalFirst: false,
                        desiredMaxRows: 2,
                        cellPadding: new EdgeInsets.only(
                            right: 4.0, bottom: 4.0, top: 4.0),
                        entryTextStyle: charts.TextStyleSpec(
                            color: charts.MaterialPalette.purple.shadeDefault,
                            fontFamily: 'Georgia',
                            fontSize: 18),
                      )
                    ],
                    defaultRenderer: new charts.ArcRendererConfig(
                        arcWidth: 100,
                        arcRendererDecorators: [
                          new charts.ArcLabelDecorator(
                              labelPosition: charts.ArcLabelPosition.inside)
                        ])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
