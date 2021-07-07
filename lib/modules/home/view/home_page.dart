import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gym_rats/models/treinos.dart';
import 'package:gym_rats/models/usuariosModel.dart';
import 'package:gym_rats/modules/drawer/components/sideMenuDrawer.dart';
import 'package:gym_rats/modules/home/components/trainingNull.dart';
import 'package:gym_rats/modules/home/components/trainingTileHome.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  String dia = DateFormat.EEEE('pt_BR').format(DateTime.now());

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
          title: Text('Home'),
          flexibleSpace: Container(
            decoration: BoxDecoration(color: Color(0xFFDF9F17)),
          ),
        ),
        body: FutureBuilder<QuerySnapshot>(
            future: Firestore.instance
                .collection("users")
                .document(model.firebaseUser.uid)
                .collection("treinos")
                .where('dia', isEqualTo: dia)
                .getDocuments(),
            builder: (context, snapshot) {
              if (snapshot.data == null || snapshot.data.documents.length == 0)
                return Center(
                  child: TrainingNull('Nada de treinos por hoje...'),
                );
              else
                return ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (ctx, i) {
                      Treinos treinos =
                          Treinos.fromDocument(snapshot.data.documents[i]);
                      return TreinoHome(treinos);
                    });
            }),
      );
    }));
  }
}
