class LoginModel{
  String id;
  String telefone;
  String email;
  String senha;

  LoginModel({this.id, this.telefone, this.email, this.senha});

  LoginModel.fromMap(Map map){
    this.id = map['id'];
    this.telefone = map['telefone'];
    this.email = map['email'];
    this.senha = map['senha'];
  }

  Map toMap(){
    Map<String, dynamic> map = {
      'id': this.id,
      'telefone': this.telefone,
      'email': this.email,
      'senha': this.senha
    };
    return map;
  }
}