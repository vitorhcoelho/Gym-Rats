import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_rats/modules/dashboard/components/grafico_grupomuscular.dart';
import 'package:gym_rats/modules/dashboard/components/meta_tile.dart';
import 'package:gym_rats/modules/drawer/components/sideMenuDrawer.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<charts.Series> seriesList;
  bool animate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: Colors.transparent,
      drawer: SideMenuDrawer(),
      backgroundColor: Color(0xFF242424),
      appBar: AppBar(
        title: Text('Dashboard'),
        flexibleSpace: Container(
          decoration: BoxDecoration(color: Color(0xFFDF9F17)),
        ),
      ),
      body: Column(
        children: [
          MetaTile(),
          GraficoGrupoMuscular(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/meta_cadastro');
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xFFDF9F17),
      ),
    );
  }
}
