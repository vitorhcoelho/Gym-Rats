import 'package:cloud_firestore/cloud_firestore.dart';

class GruposMusculares {
  String nome;
  String cor;

  GruposMusculares(nopme);

  GruposMusculares.fromDocument(DocumentSnapshot document) {
    nome = document.data["nome"];
    cor = document.data["cor"];
  }
}
