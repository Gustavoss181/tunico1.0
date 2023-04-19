import 'package:bicjr_app/data/models/usuario_model.dart';
import 'package:bicjr_app/routes/app_routes.dart';
import 'package:bicjr_app/views/components/foto_convert.dart';
import 'package:flutter/material.dart';

class OutroUsuario  extends StatefulWidget {
  UsuarioModel user;

  OutroUsuario(this.user);

  @override
  _OutroUsuarioState createState() => _OutroUsuarioState();
}

class _OutroUsuarioState extends State<OutroUsuario > {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color:Color.fromRGBO(255, 107,107, 1)),
        centerTitle: true,
        backgroundColor: Colors.grey[200],
        title: 
      Text('', style: TextStyle(color: Colors.white),), 
        
      ),
        body: Center(
          child: Form(
            child: ListView(
              children: [

              // FOTO DE PERFIL DO USUÁRIO
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 5,
                          color: Color.fromRGBO(255, 107,107, 1),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(75))
                      ),
                      child: ClipOval(
                        child: FotoConvert().retornaFoto(widget.user.foto),
                      )
                    )
                  ),
                ),
              
              // NOME DO USUÁRIO
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 20, 50, 0),
                child: Center(
                  child: Text(
                    widget.user.nome,
                    style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 20), 
                  ),
                ),
              ),
              
              // EMAIL DO USUÁRIO
              Padding(
               padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
                 child: Center(
                   child: Text(
                   widget.user.email,
                   style:  TextStyle(fontWeight: FontWeight.w100, fontSize: 13, fontStyle: FontStyle.italic ), 
                     ),
                 ),
             ),

            // DIVIDER
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 20, 50, 0),
                child: Divider(color: Color.fromRGBO(255, 148, 88, 1), ),
              ),
            
             // EMAIL DO USUÁRIO
              Padding(
               padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                 child: Center(
                   child: Text(
                   "DADOS PESSOAIS",
                   style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 14,), 
                     ),
                 ),
             ),
              // TELEFONE DO USUÁRIO
               Padding(
               padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
                   child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: //const <Widget>
                  [
                  Icon(
                    Icons.call,
                    color:Color.fromRGBO(255, 148, 88, 1),
                    size: 20.0,
                  ),
                  SizedBox(width: 5),
                  widget.user.telegram == null ?
                  Text(
                    'Telegram não registrado',
                    style: TextStyle(fontWeight: FontWeight.w100, fontSize: 13, fontStyle: FontStyle.italic ),
                  )
                  :Text(
                    widget.user.telegram,
                    style:  TextStyle(fontSize: 14,)
                  ),
               ],
              )
            ),

              // CURSO DO USUÁRIO
               Padding(
               padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
                   child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.book,
                    color: Color.fromRGBO(255, 148, 88, 1),
                    size: 20.0,
                  ),
                  SizedBox(width: 5),
                  widget.user.descricao == null ?
                  Text(
                    'Descrição não registrada',
                    style: TextStyle(fontWeight: FontWeight.w100, fontSize: 13, fontStyle: FontStyle.italic ),
                  )
                  :Text(
                    widget.user.descricao,
                    style:  TextStyle(fontSize: 14,)
                  ),
               ],
              )
            ),

              // INSTITUIÇÃO DE ENSINO DO USUÁRIO
               Padding(
               padding: const EdgeInsets.fromLTRB(50, 5, 50, 5),
                   child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.school,
                    color: Color.fromRGBO(255, 148, 88, 1),
                    size: 20.0,
                  ),
                  SizedBox(width: 5),
                  widget.user.instituicao == null ?
                  Text(
                    'Instituição não registrada',
                    style: TextStyle(fontWeight: FontWeight.w100, fontSize: 13, fontStyle: FontStyle.italic ),
                  )
                  :Text(
                    widget.user.instituicao,
                    style:  TextStyle(fontSize: 14,)
                  ),
               ],
              )
            ),
            
              // BOTÃO PARA VOLTAR PARA A TELA INICIAL
               Padding(
                padding: EdgeInsets.fromLTRB(50, 30, 50, 0),
                child: FlatButton.icon(
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                icon: Icon(Icons.keyboard_return),//icon image
                label: Text('Voltar para Página Inicial'),//text to show in button
                textColor: Colors.white,//button text and icon color.
                color: Color.fromRGBO(255, 107,107, 1),//button background color
                onPressed: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.HOME, (route) => false);
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