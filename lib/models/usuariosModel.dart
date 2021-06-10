class Usuario {
  String id;
  String email;
  String username;
  String telefone;

  Usuario({
    String email,
    String username,
    String uid,
    String telefone,
  }) {
    this.id = uid;
    this.email = email;
    this.username = username;
    this.telefone = telefone;
  }

  Usuario.fromJson(Map<String, dynamic> dados) {
    id = dados['id'];
    email = dados['email'];
    username = dados['username'];
    telefone = dados['telefone'];
  }

  // ignore: missing_return
  Map<String, dynamic> get toJson {
    final Map<String, dynamic> dados = new Map<String, dynamic>();
    dados['id'] = this.id;
    dados['email'] = this.email;
    dados['username'] = this.username;
    dados['telefone'] = this.telefone;
  }
}
