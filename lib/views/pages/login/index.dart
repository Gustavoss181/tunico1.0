import 'package:flutter/material.dart';
import 'package:tunico/controllers/login_controller.dart';
import 'package:tunico/views/components/FlatButtonExt/index.dart';
import 'package:tunico/views/components/TextFormFieldExt/index.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _controller = new LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
        child: Column(
          children: [
            SizedBox(height: 80,),

            Image(image: AssetImage('assets/images/logo.png'), width: 150, height: 150, ),

            SizedBox(height: 50,),

            // Text('____________________________________________________', style: TextStyle(color: Colors.blueGrey),),
            
            // Text('LOGIN', style: TextStyle(fontSize: 40, color: Colors.blueGrey),),

            // SizedBox(height: 30),

            // TELEFONE
            // Padding(
            //   padding: EdgeInsets.all(0),
            //   child: TextFormFieldExt(
            //     maxLenght: 11,
            //     textInputType: TextInputType.phone,
            //     prefixIcon: Icon(Icons.local_phone),
            //     prefixText: '+55 ',
            //     hintText: '(xx) xxxxx - xxxx',
            //     controller: _phoneController,
            //   ),
            // ),
            
            // EMAIL E SENHA

            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormFieldExt(
                textInputType: TextInputType.emailAddress,
                prefixIcon: Icon(Icons.alternate_email),
                hintText: 'Email',
                controller: _controller.emailController,
              ),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: TextFormFieldExt(
                textInputType: TextInputType.visiblePassword,
                prefixIcon: Icon(Icons.lock),
                hintText: 'Senha',
                controller: _controller.senhaController,
              ),
            ),

            SizedBox(height: 60),

            Padding(
              padding: EdgeInsets.all(10),
              child: FlatButtonExt(
                text: "              Entrar              ",
                function: (){
                  _controller.entrar(context);
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: FlatButtonExt(
                text: "         Criar Conta         ",
                function: (){
                  _controller.criarConta(context);
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: FlatButtonExt(
                text: "Esqueci minha senha",
                function: (){
                  //_controller.criarConta(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}