import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gym_rats/models/evolucaoModel.dart';
import 'package:gym_rats/models/usuariosModel.dart';
import 'package:gym_rats/modules/dashboard/components/meta_tile.dart';
import 'package:gym_rats/modules/drawer/components/sideMenuDrawer.dart';
import 'package:scoped_model/scoped_model.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<EvolucaoModel>(
        model: EvolucaoModel(Usuario.of(context).firebaseUser),
        child: ScopedModelDescendant<EvolucaoModel>(
            builder: (context, child, model) {
          if (model.isLoading)
            return Center(
              child: CircularProgressIndicator(),
            );

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
            body: MetaTile(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/meta_cadastro');
              },
              child: Icon(Icons.add),
              backgroundColor: Color(0xFFDF9F17),
            ),
          );
        }));
  }
}
