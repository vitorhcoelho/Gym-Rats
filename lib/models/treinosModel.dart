import 'package:flutter/cupertino.dart';

class Treino {
  final String idTreino;
  final String nome;
  final String grupoMuscular;
  final int repeticoes;
  final int series;
  final int descanso;

  const Treino({
    this.idTreino,
    @required this.nome,
    @required this.grupoMuscular,
    @required this.repeticoes,
    @required this.series,
    @required this.descanso,
  });

  // ignore: missing_return
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dados = new Map<String, dynamic>();
    dados['idTreino'] = this.idTreino;
    dados['nome'] = this.nome;
    dados['grupoMuscular'] = this.grupoMuscular;
    dados['repeticoes'] = this.repeticoes;
    dados['series'] = this.series;
    dados['descanso'] = this.descanso;
  }
}
