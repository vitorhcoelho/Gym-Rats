import 'package:cloud_firestore/cloud_firestore.dart';

class GruposMusculares {
  String nome;

  GruposMusculares();

  GruposMusculares.fromDocument(DocumentSnapshot document) {
    nome = document.data["nome"];
  }
}
