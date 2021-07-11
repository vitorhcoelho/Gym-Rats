import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:gym_rats/models/treinos.dart';
import 'package:scoped_model/scoped_model.dart';

import 'diaSemana.dart';
import 'gruposMusculares.dart';

class TreinosModel extends Model {
  String uid;
  List<Treinos> treinosLista = [];
  List<String> gruposMuscularesLista = [];
  List<String> diasSemana = [];
  bool isLoading = false;

  TreinosModel(user) {
    this.uid = user.uid;
    _loadTreinos();
    _loadGruposMusculares();
    _loadDiaSemana();
  }

  get firebaseUser => null;

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
      t.quantidade = treino["quantidade"];
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

  void concluiTreino(treino) {
    treino.quantidade++;
    Firestore.instance
        .collection("users")
        .document(this.uid)
        .collection("treinos")
        .document(treino.id)
        .updateData(
      {'quantidade': treino.quantidade},
    );
    acharGrupoMuscularCor(treino);
    notifyListeners();
  }

  void acharGrupoMuscularCor(treino) {
    Firestore.instance
        .collection("grupoMuscular")
        .where('nome', isEqualTo: treino.grupoMuscular)
        .getDocuments()
        .then((value) => quantidadeGrupoMuscular(
            treino, GruposMusculares.fromDocument(value.documents[0]).cor));
  }

  void quantidadeGrupoMuscular(treino, cor) {
    Firestore.instance
        .collection("users")
        .document(this.uid)
        .collection("grupoMuscular")
        .document(treino.grupoMuscular)
        .setData({'quantidade': treino.quantidade, 'cor': cor});

    notifyListeners();
  }
}
