class Treino {
  String grupoMuscular;
  int repeticoes;
  int series;
  int descanso;

  Treino({String grupoMuscular, int repeticoes, int series, int descanso}) {
    this.grupoMuscular = grupoMuscular;
    this.repeticoes = repeticoes;
    this.series = series;
    this.descanso = descanso;
  }

  Treino.fromJson(Map<String, dynamic> dados) {
    grupoMuscular = dados['grupoMuscular'];
    repeticoes = dados['repeticoes'];
    series = dados['series'];
    descanso = dados['descanso'];
  }

  // ignore: missing_return
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dados = new Map<String, dynamic>();
    dados['grupoMuscular'] = this.grupoMuscular;
    dados['repeticoes'] = this.repeticoes;
    dados['series'] = this.series;
    dados['descanso'] = this.descanso;
  }
}
