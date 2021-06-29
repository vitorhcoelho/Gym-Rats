import 'package:cloud_firestore/cloud_firestore.dart';

class DiaSemana {
  String nome;

  DiaSemana();

  DiaSemana.fromDocument(DocumentSnapshot document) {
    nome = document.data["nome"];
  }
}
