import 'package:cloud_firestore/cloud_firestore.dart';

class Treinos {
  String id;
  String nome;
  String grupoMuscular;
  int repeticoes;
  int series;
  int descanso;
  int dia;

  Treinos.fromDocument(DocumentSnapshot document) {
    id = document.documentID;
    nome = document.data["nome"];
    grupoMuscular = document.data["grupoMuscular"];
    repeticoes = document.data["repeticoes"];
    series = document.data["series"];
    descanso = document.data["descanso"];
    dia = document.data["dia"];
  }

  Map<String, dynamic> toMap() {
    return {
      "nome": nome,
      "grupoMuscular": grupoMuscular,
      "repeticoes": repeticoes,
      "series": series,
      "descanso": descanso,
      "dia": dia
    };
  }
}
