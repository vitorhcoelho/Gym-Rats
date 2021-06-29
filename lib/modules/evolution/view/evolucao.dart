import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gym_rats/models/usuariosModel.dart';
import 'package:gym_rats/modules/drawer/components/sideMenuDrawer.dart';
import 'package:scoped_model/scoped_model.dart';

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
    return Scaffold(
        body: ScopedModelDescendant<Usuario>(builder: (context, child, model) {
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
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.notifications,
                color: Colors.white,
                size: 25,
              ),
            )
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(color: Color(0xFFDF9F17)),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/evolucao_cadastro');
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.orange,
        ),
      );
    }));
  }
}
