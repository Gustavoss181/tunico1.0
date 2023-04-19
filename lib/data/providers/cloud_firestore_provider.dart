import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class CloudFireStoreProvider{
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  Future<String> uploadFile(String caminho, String categoria) async {
    String hora = DateTime.now().toIso8601String().substring(11, 19);
    var nome = caminho.split('/')[caminho.split('/').length - 1];
    var storageReference = firebaseStorage.ref().child('$categoria/$hora$nome');
    var file = File(caminho);

    await storageReference.putFile(file);
    var urlFile = await storageReference.getDownloadURL();

    return urlFile;
  }

  Future<void> apagarArquivo(String urlPath) async {
    try{
      await firebaseStorage.refFromURL(urlPath).delete();
    }
    catch(e){
      print(e);
    }
  }
}

class Categoria{
  final usuario = 'usuarios';
  final post = 'postagens';
}