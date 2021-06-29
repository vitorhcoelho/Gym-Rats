import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:gym_rats/models/treinos.dart';
import 'package:scoped_model/scoped_model.dart';

class TreinosModel extends Model {
  String uid;
  List<Treinos> treinosLista = [];
  bool isLoading = false;

  TreinosModel(user) {
    this.uid = user.uid;
    _loadTreinos();
  }

  static TreinosModel of(BuildContext context) =>
      ScopedModel.of<TreinosModel>(context);

  void addTreinos(treino) {
    Firestore.instance
        .collection("users")
        .document(this.uid)
        .collection("treinos")
        .add(treino)
        .then((doc) {
      Treinos t = new Treinos();
      t.nome = treino["nome"];
      t.grupoMuscular = treino["grupoMuscular"];
      t.repeticoes = treino["repeticoes"];
      t.series = treino["series"];
      t.descanso = treino["descanso"];
      t.dia = treino["dia"];
      t.id = doc.documentID;
      treinosLista.add(t);
    });

    notifyListeners();
  }

  void removeTreinos(Treinos treinos) {
    Firestore.instance
        .collection("users")
        .document(this.uid)
        .collection("treinos")
        .document(treinos.id)
        .delete();

    treinosLista.remove(treinos);

    notifyListeners();
  }

  void _loadTreinos() async {
    QuerySnapshot query = await Firestore.instance
        .collection("users")
        .document(this.uid)
        .collection("treinos")
        .getDocuments();

    treinosLista =
        query.documents.map((doc) => Treinos.fromDocument(doc)).toList();

    notifyListeners();
  }
}
