
class UsuarioModel  {
  String id;
  String nome;
  String instituicao;
  String foto;
  String email;
  String descricao;
  String telegram;

  UsuarioModel({this.id, this.nome, this.instituicao, this.foto, this.email, this.descricao, this.telegram});

  UsuarioModel.fromMap(Map map){
    this.id = map['id'];
    this.nome = map['nome'];
    this.instituicao = map['instituicao'];
    this.foto = map['foto'];
    this.email = map['email'];
    this.descricao = map['descricao'];
    this.telegram = map['telegram'];
  }

  Map toMap(){
    Map<String, dynamic> map ={
      'nome': this.nome,
      'instituicao': this.instituicao,
      'foto': this.foto,
      'email': this.email,
      'descricao': this.descricao,
      'telegram': this.telegram
    };

    return map;
  }
}