import 'package:flutter/cupertino.dart';

class CriarContaController{
  //final _usuarioRepository = UsuarioRepository();
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  void criarConta(BuildContext context) async {
    // var usuario = new UsuarioModel(
    //   nome: nomeController.text, 
    //   email: emailController.text.trim()
    // );
    // var retorno = await _usuarioRepository.incluir(usuario, senhaController.text.trim());
    // if (retorno) {
    //   Navigator.of(context).pushReplacementNamed(AppRoutes.LOGIN);
    // } else {
    //   print('Falha ao cadastrar o Usuario');
    // }
  }
}