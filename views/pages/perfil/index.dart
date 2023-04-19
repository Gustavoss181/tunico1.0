import 'package:bicjr_app/controllers/perfil_controller.dart';
import 'package:bicjr_app/views/components/flat_button_ext.dart';
import 'package:bicjr_app/views/components/foto_convert.dart';
import 'package:bicjr_app/views/components/text_form_field_ext.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class PerfilUsuario extends StatefulWidget {
  @override
  _PerfilUsuarioState createState() => _PerfilUsuarioState();
}

class _PerfilUsuarioState extends State<PerfilUsuario> {
  final _formKey = GlobalKey<FormState>();
  final imagePicker = ImagePicker();
  final _controller = PerfilController();

  bool consertarProblema = true;

  Future <String> createAlertDialog(BuildContext context){
    TextEditingController customController =  TextEditingController();
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(29.5, 0, 29.5, 0),
          child: Text('Insira a sua senha', style: TextStyle(fontSize: 18),),
        ),
        content:TextField(
          controller: customController,
          decoration: InputDecoration(
            labelText: 'Senha',
            icon: Icon(Icons.vpn_key, color:  Color.fromRGBO(255, 148, 88, 1),),
          ),
          keyboardType: TextInputType.text,
          obscureText: true,
        ),
        actions: <Widget> [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 60, 0),
            child: MaterialButton(
              elevation: 0.0,
              child: Text('CANCELAR'),
              onPressed: (){
                Navigator.pop(context);
              },
               color: Colors.grey[200],
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
            child: MaterialButton(
              elevation: 5.0,
              child: Text('OK'),
              onPressed: (){
                _controller.apagarUsuario(context, customController.text);
              },
              color: Color.fromRGBO(255, 107,107, 1),
            ),
          )
        ],
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    if(consertarProblema){
      _controller.loadUserData(context).then((value) {
        setState(() {});
        consertarProblema = false;
      });
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color:Colors.white),
        centerTitle: true,
        backgroundColor:Color.fromARGB(247, 247, 107, 107),
        title: Text('Perfil do usuário', style: TextStyle(color: Colors.white),), 
      ),
      
      body: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.all(0),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 200,
                        height: 200,
                        child: ClipOval(
                          child: FotoConvert().retornaFoto(_controller.fotoController.text),
                        )
                      )
                    ),
                    Center(
                      child: Container(
                        color: Colors.transparent,
                        width: 250,
                        height: 210,
                        child: Stack(
                          children: [
                            Align(
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
                                    if (fotoSelecionada == null) return;
                                    _controller.fotoController.text = fotoSelecionada.path;
                                  });
                                },
                              ),
                            ),
                            if(_controller.fotoController.text != "")
                              Align(
                                alignment: Alignment.bottomRight,
                                child: IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    _controller.fotoController.text = "";
                                    setState(() {});
                                  },
                                )
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 10, 50, 5),
                child: Center(
                  child: Text(
                    _controller.nome == null? '' : _controller.nome,
                    style: TextStyle(fontSize: 16)
                  )
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: Center(
                  child: Text(
                    _controller.email == null ? '' : _controller.email,
                    style: TextStyle(fontSize:13,fontStyle: FontStyle.italic )
                  )
                )
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 5, 50, 0),
                child: TextFormFieldExt(
                  labelText: 'Instituição de Ensino',
                  keyboardType: TextInputType.text,
                  prefixIcon: Icon(Icons.school, color: Colors.indigo),
                  controller: _controller.instituicaoController,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 5, 50, 5),
                child: TextFormFieldExt(
                  labelText: 'Telegram',
                  keyboardType: TextInputType.number,
                  prefixIcon: Icon(Icons.phone, color: Colors.indigo),
                  controller: _controller.telegramController,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 5, 50, 0),
                child: TextFormField(
                  onFieldSubmitted: (String value){
                    setState(() {
                      //_deskripsiController.text = value;
                    });
                  },
                  decoration: const InputDecoration(
                    border: const UnderlineInputBorder(),
                    labelText: "Descrição",
                    icon: Icon(Icons.edit, color: Colors.indigo,)
                  ),
                  controller: _controller.descricaoController,
                  maxLength: 50,
                )
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 20, 50, 0),
                child: FlatButtonExt(
                  text: 'Salvar',
                  onPressed: () {
                    _controller.salvar(context);
                  },
                ),
              ),
               Padding(
                padding: EdgeInsets.fromLTRB(50, 10, 50, 0),
                child: FlatButtonExt(
                  text: 'Apagar Conta',
                  onPressed: () {
                    createAlertDialog(context);
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