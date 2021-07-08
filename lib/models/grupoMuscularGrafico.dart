class GruposMuscularesGrafico {
  final String nome;
  final int quantidade;
  final String cor;
  GruposMuscularesGrafico(this.nome, this.quantidade, this.cor);

  GruposMuscularesGrafico.fromMap(Map<String, dynamic> map, nomeMusculo)
      : assert(map['quantidade'] != null),
        nome = nomeMusculo,
        quantidade = map['quantidade'],
        cor = map['cor'];

  @override
  String toString() => "Record<$nome:$quantidade>";
}
