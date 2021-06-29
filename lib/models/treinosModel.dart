import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:gym_rats/models/treinos.dart';
import 'package:gym_rats/models/usuariosModel.dart';
import 'package:scoped_model/scoped_model.dart';

class TreinosModel extends Model {
  Usuario user;
  List<Treinos> treinosLista = [];
  bool isLoading = false;

  TreinosModel(this.user) {
    if (user.isLoggedIn()) _loadTreinos();
  }

  static TreinosModel of(BuildContext context) =>
      ScopedModel.of<TreinosModel>(context);

  void addTreinos(Treinos treinos) {
    treinosLista.add(treinos);
    Firestore.instance
        .collection("users")
        .document(user.firebaseUser.uid)
        .collection("treinos")
        .add(treinos.toMap())
        .then((doc) {
      treinos.id = doc.documentID;
    });

    notifyListeners();
  }

  void removeTreinos(Treinos treinos) {
    Firestore.instance
        .collection("users")
        .document(user.firebaseUser.uid)
        .collection("treinos")
        .document(treinos.id)
        .delete();

    treinosLista.remove(treinos);

    notifyListeners();
  }

  void _loadTreinos() async {
    QuerySnapshot query = await Firestore.instance
        .collection("users")
        .document(user.firebaseUser.uid)
        .collection("treinos")
        .getDocuments();

    treinosLista =
        query.documents.map((doc) => Treinos.fromDocument(doc)).toList();

    notifyListeners();
  }
}
