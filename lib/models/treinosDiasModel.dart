import 'package:gym_rats/models/treinosModel.dart';

class TreinoDias {
  String uid;
  String dia;
  List<Treino> treinos;

  TreinoDias({
    String uid,
    String dia,
    List<Treino> treinos,
  }) {
    this.uid = uid;
    this.dia = dia;
    this.treinos = treinos;
  }

  TreinoDias.fromJson(Map<String, dynamic> dados) {
    uid = dados['uid'];
    dia = dados['dia'];
    treinos = dados['treinos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dados = new Map<String, dynamic>();
    dados['uid'] = this.uid;
    dados['dia'] = this.dia;
    dados['treinos'] = this.treinos;
  }
}
