import 'package:cloud_firestore/cloud_firestore.dart';

class Treinos {
  String id;
  String nome;
  String grupoMuscular;
  String repeticoes;
  String series;
  String descanso;
  String dia;
  int quantidade;

  Treinos();

  Treinos.fromDocument(DocumentSnapshot document) {
    id = document.documentID;
    nome = document.data["nome"];
    grupoMuscular = document.data["grupoMuscular"];
    repeticoes = document.data["repeticoes"];
    series = document.data["series"];
    descanso = document.data["descanso"];
    dia = document.data["dia"];
    quantidade = document.data["quantidade"];
  }
}
