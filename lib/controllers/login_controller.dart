import 'package:flutter/material.dart';
import 'package:tunico/data/repositories/login_repository.dart';
import 'package:tunico/routes/app_routes.dart';

class LoginController{
  final _repository = LoginRepository();

  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  void entrar(BuildContext context) async{
    if (emailController.text.trim().length == 0){
      print("Email nao informado");
    }

    if (senhaController.text.trim().length < 6){
      print("Senha muito curta");
    }

    var login = await _repository.efetuarLogin(emailController.text, senhaController.text);

    if (login == null){
      print("Login invalido");
    }
    else{
      Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
    }
  }

  void criarConta(BuildContext context) async{
    Navigator.of(context).pushNamed(AppRoutes.CRIAR_CONTA);
  }

}