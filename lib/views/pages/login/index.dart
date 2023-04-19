import 'package:bicjr_app/controllers/login_controller.dart';
import 'package:bicjr_app/views/components/flat_button_ext.dart';
import 'package:bicjr_app/views/components/text_form_field_ext.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _controller = new LoginController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('NOME DO APP')),
        backgroundColor:Color.fromARGB(247, 247, 107, 107),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.transparent,
            ),
            onPressed: () {
              // do something
            },)
        ],
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: 
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Container(
              padding: EdgeInsets.all(0),
                child: ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    child: Center(child: Text('BEM-VINDO(A)!',
                    style: TextStyle(fontSize: 23, color: Colors.blue[900], fontWeight: FontWeight.bold, ),))
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 5, 50, 0),
                    child: Center(child: Text('Entre com seu e-mail e senha informados em seu cadastro.',
                    style: TextStyle(fontSize: 13, color: Colors.grey[600],),))
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 25, 50, 0),
                    child: TextFormFieldExt(
                      labelText: 'E-mail',
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icon(Icons.email,color: Colors.blue[900]),
                      controller: _controller.emailController,
                      validator: (text) {
                        if (text.trim().length == 0)
                          return 'Email não informado';
                      }
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(60, 20, 60, 0),
                    child: TextFormField(
                      controller: _controller.senhaController,
                      keyboardType: TextInputType.text,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        labelText: "Senha", 
                        prefixIcon: Icon(Icons.vpn_key, color: Colors.blue[900]),
                        suffixIcon: IconButton(
                          icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off, color: Colors.blue[900]),
                          onPressed: (){
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        )
                      ),
                      validator: (text) {
                        if (text.trim().length < 6)
                          return 'Senha muito curta';
                      }
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(50, 40, 50, 0),
                    child: FlatButtonExt(
                      text: 'Entrar',
                      onPressed: () {
                        if (!_formKey.currentState.validate()) return;
                        _controller.entrar(context);
                      },
                    ),
                  ),
                  
                  SizedBox(height: 20,),
                  Center(
                    child: InkWell(
                      child: Text('Esqueci a minha senha'),
                      onTap:(){
                        if (!_formKey.currentState.validate()) return;
                        _controller.recuperarSenha(context);
                      }
                    )
                  ),
                  SizedBox(height: 20,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}