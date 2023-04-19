import 'dart:io';
import 'package:flutter/material.dart';

class FotoConvert {

  dynamic retornaFoto(String caminho, {bool grupo}) {
  String image;
    if(grupo == true)
      image = 'avatar_grupo.png';
    else
      image = 'usuarios.jpg';
      
    if (caminho == '' || caminho == null) {
      return Image.asset('assets/images/'+ image);
    }
    else {
      if (caminho.contains('http'))
        try {
          return Image.network(
            caminho,
            fit: BoxFit.cover,
            loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color.fromRGBO(255, 148, 88, 1)),
                ),
              );
            },
          );
        } catch (ex) {
          return Image.asset('assets/images/' + image, fit: BoxFit.cover);
        }
      else
        try {
          return Image.file(File(caminho));
        } catch (ex) {
          return Image.asset('assets/images/' + image);
        }
    }
  }
}