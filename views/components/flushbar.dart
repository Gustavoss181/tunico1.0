import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlushbarExt{

  Map firebaseExceptions = {
    '[firebase_auth/invalid-email] The email address is badly formatted.':
      'Endereço de e-mail inválido',
    '[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.':
      'Usuário não encontrado.',
    '[firebase_auth/wrong-password] The password is invalid or the user does not have a password.':
      'Senha inválida.',
    '[firebase_auth/unknown] com.google.firebase.FirebaseException: An internal error has occurred. [ Unable to resolve host "www.googleapis.com":No address associated with hostname ]':
      'Verifique sua conexão com a internet.',
    '[firebase_auth/too-many-requests] We have blocked all requests from this device due to unusual activity. Try again later.':
      'Houve muitas tentativas de acesso.\nTente novamente mais tarde.',
    '[firebase_auth/unknown] Given String is empty or null':
      'Campo(s) não preenchido(s)',
    '[firebase_auth/email-already-in-use] The email address is already in use by another account.':
      'Este e-mail já está sendo usado em outra conta.'
  };

  String erro(String ex) {
    return firebaseExceptions[ex] == null ? ex : firebaseExceptions[ex];
  }

  Future<dynamic> mostrarErro(BuildContext context, String mensagem) {
    return Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      title: 'ATENÇÃO!',
      message: mensagem,
      duration: Duration(seconds: 3),
      backgroundColor: Colors.indigo,
    ).show(context);
  }
}