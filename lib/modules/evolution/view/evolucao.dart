// ignore: unused_import
// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gym_rats/models/evolucao.dart';
import 'package:gym_rats/models/usuariosModel.dart';
import 'package:gym_rats/modules/drawer/components/sideMenuDrawer.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:timeline_tile/timeline_tile.dart';

class EvolucaoPage extends StatefulWidget {
  @override
  _EvolucaoPageState createState() => _EvolucaoPageState();
}

class _EvolucaoPageState extends State<EvolucaoPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<Usuario>(builder: (context, child, model) {
      if (model.isLoading)
        return Center(
          child: CircularProgressIndicator(),
        );

      return Scaffold(
        drawerScrimColor: Colors.transparent,
        drawer: SideMenuDrawer(),
        backgroundColor: Color(0xFF242424),
        appBar: AppBar(
          title: Text('Evolução'),
          flexibleSpace: Container(
            decoration: BoxDecoration(color: Color(0xFFDF9F17)),
          ),
        ),
        body: FutureBuilder<QuerySnapshot>(
            future: Firestore.instance
                .collection("users")
                .document(model.firebaseUser.uid)
                .collection("evolucao")
                .getDocuments(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(
                  child: CircularProgressIndicator(),
                );
              else
                return _ActivityTimeline(snapshot.data.documents);
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/evolucao_cadastro');
          },
          child: Icon(Icons.add),
          backgroundColor: Color(0xFFDF9F17),
        ),
      );
    });
  }
}

class _ActivityTimeline extends StatefulWidget {
  final List evolucao;
  const _ActivityTimeline(this.evolucao);

  @override
  _ActivityTimelineState createState() => _ActivityTimelineState();
}

class _ActivityTimelineState extends State<_ActivityTimeline> {
  List<Step> _steps;

  @override
  void initState() {
    _steps = _generateData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 99999,
      child: Theme(
        data: Theme.of(context).copyWith(
          accentColor: Colors.white.withOpacity(0.2),
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              Expanded(
                child: _TimelineActivity(steps: _steps),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  List<Step> _generateData() {
    List<Step> lista = [];
    for (int i = 0; i < widget.evolucao.length; i++) {
      Evolucao evolucoes = Evolucao.fromDocument(widget.evolucao[i]);
      lista.add(
        Step(
          hour: evolucoes.data,
          type: Type.checkpoint,
          message: evolucoes.peso + '\n' + evolucoes.descricao,
          color: Colors.orange,
        ),
      );
      lista.add(
        Step(
          type: Type.line,
          color: Colors.orange,
        ),
      );
    }
    return lista;
  }
}

class _TimelineActivity extends StatelessWidget {
  const _TimelineActivity({Key key, this.steps}) : super(key: key);

  final List<Step> steps;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: steps.length,
      itemBuilder: (BuildContext context, int index) {
        final Step step = steps[index];

        final IndicatorStyle indicator = step.isCheckpoint
            ? _indicatorStyleCheckpoint(step)
            : const IndicatorStyle(width: 0);

        final righChild = _RightChildTimeline(step: step);

        Widget leftChild;
        if (step.hasHour) {
          leftChild = _LeftChildTimeline(step: step);
        }

        return TimelineTile(
          alignment: TimelineAlign.manual,
          isFirst: index == 0,
          isLast: index == steps.length - 1,
          lineXY: 0.25,
          indicatorStyle: indicator,
          startChild: leftChild,
          endChild: righChild,
          hasIndicator: step.isCheckpoint,
          beforeLineStyle: LineStyle(
            color: step.color,
            thickness: 8,
          ),
        );
      },
    );
  }

  IndicatorStyle _indicatorStyleCheckpoint(Step step) {
    return IndicatorStyle(
      width: 35,
      height: 35,
      indicator: Container(
        decoration: BoxDecoration(
          color: step.color,
          borderRadius: const BorderRadius.all(
            Radius.circular(9999),
          ),
        ),
        child: Center(
          child: Icon(
            step.icon,
            color: const Color(0xFF1D1E20),
            size: 20,
          ),
        ),
      ),
    );
  }
}

class _RightChildTimeline extends StatelessWidget {
  const _RightChildTimeline({Key key, this.step}) : super(key: key);

  final Step step;

  @override
  Widget build(BuildContext context) {
    // final double minHeight =
    //     step.isCheckpoint ? 100 : step.duration.toDouble() * 8;

    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: step.isCheckpoint ? 20 : 39, top: 8, bottom: 8, right: 8),
            child: RichText(
              text: TextSpan(children: <TextSpan>[
                TextSpan(
                  text: step.message,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                // TextSpan(
                //   text: '  ${step.duration} min',
                //   style: TextStyle(
                //     color: const Color(0xFFF2F2F2),
                //   ),
                // )
              ]),
            ),
          )
        ],
      ),
    );
  }
}

class _LeftChildTimeline extends StatelessWidget {
  const _LeftChildTimeline({Key key, this.step}) : super(key: key);

  final Step step;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: step.isCheckpoint ? 10 : 29),
          child: Text(
            step.hour,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
            ),
          ),
        )
      ],
    );
  }
}

enum Type {
  checkpoint,
  line,
}

class Step {
  Step({
    this.type,
    this.hour,
    this.message,
    this.color,
    this.icon,
  });

  final Type type;
  final String hour;
  final String message;
  final Color color;
  final IconData icon;

  bool get isCheckpoint => type == Type.checkpoint;

  bool get hasHour => hour != null && hour.isNotEmpty;
}
