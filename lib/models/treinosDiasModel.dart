import 'package:gym_rats/models/treinosModel.dart';

class TreinoDias {
  String uid;
  String dia;
  DateTime data;
  bool realizacao;
  List<Treino> treinos;

  TreinoDias({
    String uid,
    String dia,
    DateTime data,
    bool realizacao,
    List<Treino> treinos,
  }) {
    this.uid = uid;
    this.dia = dia;
    this.data = data;
    this.realizacao = realizacao;
    this.treinos = treinos;
  }

  TreinoDias.fromJson(Map<String, dynamic> dados) {
    uid = dados['uid'];
    dia = dados['dia'];
    data = dados['data'];
    realizacao = dados['realizacao'];
    treinos = dados['treinos'];
  }

  // ignore: missing_return
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dados = new Map<String, dynamic>();
    dados['uid'] = this.uid;
    dados['dia'] = this.dia;
    dados['data'] = this.data;
    dados['realizacao'] = this.realizacao;
    dados['treinos'] = this.treinos;
  }
}
