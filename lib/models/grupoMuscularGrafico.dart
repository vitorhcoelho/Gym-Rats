class GruposMuscularesGrafico {
  final String nome;
  final int quantidade;
  GruposMuscularesGrafico(this.nome, this.quantidade);

  GruposMuscularesGrafico.fromMap(Map<String, dynamic> map)
      : assert(map['nome'] != null),
        assert(map['quantidade'] != null),
        nome = map['nome'],
        quantidade = map['quantidade'];

  @override
  String toString() => "Record<$nome:$quantidade>";
}
