import 'package:cloud_firestore/cloud_firestore.dart';

class Evolucao {
  String id;
  String descricao;
  String data;
  String peso;

  Evolucao();

  Evolucao.fromDocument(DocumentSnapshot document) {
    id = document.documentID;
    descricao = document.data["descricao"];
    peso = document.data["peso"];
    data = document.data["data"];
  }
}
