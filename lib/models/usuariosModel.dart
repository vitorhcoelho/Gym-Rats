class Usuario {
  String email;
  String id;
  String telefone;

  Usuario({
    String email,
    String uid,
    String telefone,
  }) {
    this.email = email;
    this.id = uid;
    this.telefone = telefone;
  }

  Usuario.fromJson(Map<String, dynamic> dados) {
    email = dados['email'];
    id = dados['id'];
    telefone = dados['telefone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dados = new Map<String, dynamic>();
    dados['email'] = this.email;
    dados['id'] = this.id;
    dados['telefone'] = this.telefone;
  }
}
