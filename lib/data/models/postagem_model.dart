import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  String idPost;
  String idUser;
  int ref;
  Timestamp data;
  String texto;
  String filePath;

  PostModel({this.idPost, this.idUser, this.ref,this.data, this.texto, this.filePath});

  PostModel.fromMap(Map map) {
    this.idPost = map['idPost'];
    this.idUser = map['idUser'];
    this.ref = map['ref'];
    this.data = map['data'];
    this.filePath = map['filePath'];
    this.texto = map['texto'];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      'idUser': this.idUser,
      'ref': this.ref,
      'data': this.data,
      'filePath': this.filePath,
      'texto': this.texto,
    };
    return map;
  }
}