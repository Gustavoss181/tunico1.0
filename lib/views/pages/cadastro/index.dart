import 'package:bicjr_app/controllers/criar_conta_controller.dart';
import 'package:bicjr_app/views/components/flat_button_ext.dart';
import 'package:bicjr_app/views/components/foto_convert.dart';
import 'package:bicjr_app/views/components/text_form_field_ext.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TelaCadastro extends StatefulWidget {
  @override
  _TelaCadastroState createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final _formKey = GlobalKey<FormState>();
  final imagePicker = ImagePicker();
  final _controller = CriarContaController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 3, 15, 0),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 180,
                        height: 180,
                        child: ClipOval(
                          child: FotoConvert().retornaFoto(_controller.fotoController.text),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        color: Colors.transparent,
                        width: 250,
                        height: 190,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: PopupMenuButton<int>(
                            itemBuilder: (context) => <PopupMenuEntry<int>>[
                              const PopupMenuItem<int>(
                                child: Text('Câmera'),
                                value: 0,
                              ),
                              const PopupMenuItem<int>(
                                child: Text('Galeria'),
                                value: 1,
                              )
                            ],
                            onSelected: (valor) async {
                              final fotoSelecionada =
                                  await imagePicker.getImage(
                                      source: (valor == 0
                                          ? ImageSource.camera
                                          : ImageSource.gallery));
                              setState(() {
                                if(fotoSelecionada == null) return;
                                _controller.fotoController.text = fotoSelecionada.path;
                              });
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: TextFormFieldExt(
                  labelText: 'Nome',
                  keyboardType: TextInputType.name,
                  prefixIcon: Icon(Icons.edit, color: Colors.blue[900]),
                  controller: _controller.nomeController,
                  validator: (text) {
                    if (text.trim().length == 0)
                      return 'Nome não informado';
                  }
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50,0, 50, 0),
                child: TextFormFieldExt(
                  labelText: 'E-mail',
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icon(Icons.email, color:  Colors.blue[900],),
                  controller: _controller.emailController,
                  validator: (text) {
                    if (text.trim().length == 0)
                      return 'E-mail não informado';
                  }
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: TextFormFieldExt(
                  labelText: 'Instituição de Ensino',
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icon(Icons.school, color:  Colors.blue[900],),
                  controller: _controller.instituicaoController,
                  validator: (text) {
                    if (text.trim().length == 0)
                      return 'Instituição não informada';
                  }
                ),
              ),
               Padding(
                padding: EdgeInsets.fromLTRB(60, 10, 60, 0),
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
                      return 'A senha precisa ter no mímino 6 caracteres';
                  }
                )
              ),
              
              Padding(
                padding: EdgeInsets.fromLTRB(50, 30, 50, 0),
                child: FlatButtonExt(
                  text: 'Cadastrar',
                  onPressed: () {
                    if (!_formKey.currentState.validate()) return;
                    _controller.criarConta(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}