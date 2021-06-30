import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:gym_rats/models/treinos.dart';
import 'package:scoped_model/scoped_model.dart';

import 'diaSemana.dart';
import 'gruposMusculares.dart';
import 'item.dart';

class TreinosModel extends Model {
  String uid;
  List<Treinos> treinosLista = [];
  List<String> gruposMuscularesLista = [];
  List<String> diasSemana = [];
  List<Treinos> treinoDoDia = [];
  List<Item> itens = [];
  bool isLoading = false;

  TreinosModel(user) {
    this.uid = user.uid;
    _loadTreinos();
    _loadGruposMusculares();
    _loadDiaSemana();
    _loadTreinoDoDia();
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

  void _loadGruposMusculares() async {
    QuerySnapshot query =
        await Firestore.instance.collection("grupoMuscular").getDocuments();

    gruposMuscularesLista = query.documents
        .map((doc) => GruposMusculares.fromDocument(doc).nome)
        .toList();

    notifyListeners();
  }

  void _loadDiaSemana() async {
    QuerySnapshot query =
        await Firestore.instance.collection("diaDaSemana").getDocuments();
    diasSemana =
        query.documents.map((doc) => DiaSemana.fromDocument(doc).nome).toList();
    notifyListeners();
  }

  void _loadTreinoDoDia() async {
    QuerySnapshot query = await Firestore.instance
        .collection("users")
        .document(this.uid)
        .collection("treinos")
        .getDocuments();
    treinoDoDia =
        query.documents.map((doc) => Treinos.fromDocument(doc)).toList();
    notifyListeners();
    generateItems(treinoDoDia);
  }

  void generateItems(List<Treinos> lista) {
    itens = List<Item>.generate(lista.length, (int index) {
      return Item(
          headerValue: lista[index].nome,
          expandedValue: lista[index].series +
              ' séries com ' +
              lista[index].repeticoes +
              ' repetições');
    });
  }
}
