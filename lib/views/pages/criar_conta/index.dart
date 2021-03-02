import 'package:flutter/material.dart';
import 'package:tunico/controllers/criar_conta_controller.dart';
import 'package:tunico/views/components/FlatButtonExt/index.dart';
import 'package:tunico/views/components/TextFormFieldExt/index.dart';

class CriarContaPage extends StatefulWidget {
  @override
  _CriarContaPageState createState() => _CriarContaPageState();
}

class _CriarContaPageState extends State<CriarContaPage> {
  final _formKey = GlobalKey<FormState>();
  final _controller = CriarContaController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Criar Conta", style: TextStyle(color: Colors.white),)
          ],
        ),
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
            child: Column(
              children: [
                SizedBox(height: 20),

                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextFormFieldExt(
                    textInputType: TextInputType.name,
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Nome Completo',
                    controller: _controller.nomeController,
                  ),
                ),

                // Padding(
                //   padding: EdgeInsets.all(10),
                //   child: TextFormFieldExt(
                //     maxLenght: 11,
                //     textInputType: TextInputType.phone,
                //     prefixIcon: Icon(Icons.local_phone),
                //     prefixText: '+55 ',
                //     hintText: '(xx) xxxxx - xxxx',
                //   ),
                // ),

                // Padding(
                //   padding: EdgeInsets.all(10),
                //   child: TextFormFieldExt(
                //     textInputType: TextInputType.text,
                //     prefixIcon: Icon(Icons.location_city),
                //     hintText: 'Cidade',
                //   ),
                // ),

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
                    text: "          Criar Conta          ",
                    function: (){
                      _controller.criarConta(context);
                    },
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}