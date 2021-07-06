class GruposMuscularesGrafico {
  final String nome;
  final int quantidade;
  GruposMuscularesGrafico(this.nome, this.quantidade);

  GruposMuscularesGrafico.fromMap(Map<String, dynamic> map, nomeMusculo)
      : nome = nomeMusculo,
        quantidade = map['quantidade'];

  @override
  String toString() => "Record<$nome:$quantidade>";
}
