import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:gym_rats/models/evolucao.dart';
import 'package:scoped_model/scoped_model.dart';

class EvolucaoModel extends Model {
  List<Evolucao> evolucaoLista = [];
  bool isLoading = false;
  String uid;

  EvolucaoModel(user) {
    this.uid = user.uid;
    _loadEvolucao();
  }

  static EvolucaoModel of(BuildContext context) =>
      ScopedModel.of<EvolucaoModel>(context);

  void addEvolucao(evolucao) {
    Firestore.instance
        .collection("users")
        .document(this.uid)
        .collection("evolucao")
        .add(evolucao)
        .then((doc) {
      Evolucao e = new Evolucao();
      e.data = evolucao['data'];
      e.peso = evolucao['peso'];
      e.descricao = evolucao['descricao'];
      e.id = doc.documentID;
      evolucaoLista.add(e);
    });
    notifyListeners();
  }

  void removeEvolucao(Evolucao evolucao) {
    Firestore.instance
        .collection("users")
        .document(this.uid)
        .collection("evolucao")
        .document(evolucao.id)
        .delete();

    evolucaoLista.remove(evolucao);

    notifyListeners();
  }

  void _loadEvolucao() async {
    QuerySnapshot query = await Firestore.instance
        .collection("users")
        .document(this.uid)
        .collection("evolucao")
        .getDocuments();

    evolucaoLista =
        query.documents.map((doc) => Evolucao.fromDocument(doc)).toList();

    notifyListeners();
  }
}
