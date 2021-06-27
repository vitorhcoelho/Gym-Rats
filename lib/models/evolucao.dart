import 'package:cloud_firestore/cloud_firestore.dart';

class Evolucao {
  String id;
  String descricao;
  DateTime data;
  int peso;

  Evolucao();

  Evolucao.fromDocument(DocumentSnapshot document) {
    id = document.documentID;
    descricao = document.data["descricao"];
    peso = document.data["peso"];
    data = document.data["data"];
  }

  Map<String, dynamic> toMap() {
    return {"descricao": descricao, "peso": peso, "data": data};
  }
}
