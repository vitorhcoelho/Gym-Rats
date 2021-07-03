import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gym_rats/models/treinos.dart';
import 'package:gym_rats/models/usuariosModel.dart';
import 'package:gym_rats/modules/drawer/components/sideMenuDrawer.dart';
import 'package:gym_rats/modules/home/components/trainingNull.dart';
import 'package:gym_rats/modules/training/view/training_tile.dart';
import 'package:scoped_model/scoped_model.dart';

class NewTrainingPage extends StatefulWidget {
  @override
  _NewTrainingPageState createState() => _NewTrainingPageState();
}

class _NewTrainingPageState extends State<NewTrainingPage> {
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
          title: Text('Treinos'),
          flexibleSpace: Container(
            decoration: BoxDecoration(color: Color(0xFFDF9F17)),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/training_form');
          },
          child: Icon(Icons.add),
          backgroundColor: Color(0xFFDF9F17),
        ),
        body: FutureBuilder<QuerySnapshot>(
            future: Firestore.instance
                .collection("users")
                .document(model.firebaseUser.uid)
                .collection("treinos")
                .getDocuments(),
            builder: (context, snapshot) {
              if (snapshot.data == null || snapshot.data.documents.length == 0)
                return Center(
                  child: TrainingNull('Sem treinos cadastrados!'),
                );
              else
                return ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (ctx, i) {
                      return TreinoTile(
                          Treinos.fromDocument(snapshot.data.documents[i]));
                    });
            }),
      );
    }));
  }
}
