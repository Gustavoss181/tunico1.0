import 'package:bicjr_app/controllers/questoes_comentadas_controller.dart';
import 'package:bicjr_app/views/components/card_questComen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class QuestoesComentadasPage extends StatefulWidget {
  @override
  _QuestoesComentadasPageState createState() => _QuestoesComentadasPageState();
}

class _QuestoesComentadasPageState extends State<QuestoesComentadasPage> {
  final _controller = QuestoesComentadasController();
  final imagePicker = ImagePicker();
  PlatformFile _pdfFile;
  bool controle = true;

  Future<void> controlar() async {
    controle = true;
  }

  Future<String> createAlertDialog(BuildContext context, String colecao, String idPost){
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(29.5, 0, 29.5, 0),
          child: Text('Apagar a postagem?', style: TextStyle(fontSize: 18),),
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
              onPressed: () async {
                await _controller.excluirPost(colecao, idPost);
                Navigator.pop(context);
                setState(() {});
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
    final Map args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text("Questões Comentadas"),
        elevation: 0,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
        },
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: controle ? _controller.atualizarPosts(context, args["pag"], args["ref"]) :
                controlar(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (_controller.posts.length == 0 || _controller.posts == null)
                      return Center(
                        child: Text("Nenhuma postagem"),
                      );
                    return ListView.builder(
                      itemCount: _controller.posts.length,
                      itemBuilder: (context, index) {
                        var post = _controller.posts[index];
                        var user = _controller.usuarios[index];
                        return CardQuestoesComentadas(
                          user: user,
                          post: post,
                          colecao: args['pag'],
                          currentUserId: _controller.currentUserId,
                          funcao: () => createAlertDialog(context, args['pag'], post.idPost),
                        );
                      }
                    );
                  }
                  else {
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
                      )
                    );
                  }
                },
              ),
            ),
            Column(
              children: [
                if (_controller.filePath != null)
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20), topRight: Radius.circular(20)
                            )
                          ),
                          child: Container(
                            color: Colors.white,
                            child: Row(
                              children: [
                                Expanded(
                                  // child: Flexible(
                                  //   fit: FlexFit.loose,
                                    child: Text(
                                      _pdfFile != null ? _pdfFile.name : _controller.filePath,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                // ),
                                IconButton(
                                  icon: Icon(Icons.close),
                                  onPressed: (){
                                    setState(() {
                                      controle = false;
                                      _pdfFile = null;
                                      _controller.filePath = null;
                                    });
                                  },
                                )
                              ],
                            ),
                          )
                        ),
                      ),
                    ],
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.picture_as_pdf),
                        onPressed: () async {
                          await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['pdf'])
                          .then((result) {
                            if (result != null) {
                              setState(() {
                                controle = false;
                                _pdfFile = result.files.first;
                                _controller.filePath = _pdfFile.path;
                              });
                            }
                          });
                        },
                      ),
                      Expanded(
                        child: TextField(
                          controller: _controller.textoController,
                          decoration: InputDecoration.collapsed(
                            hintText: "Escreva algo..."
                          ),
                        )
                      ),
                      IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () async{
                          if(_controller.filePath == null) 
                            _controller.createFlushbar(context, "É necessário anexar um arquivo");
                          else{
                            await _controller.fazerPostagem(context, args["pag"], args["ref"]);
                            setState(() {
                              controle = true;
                              _controller.filePath = null;
                              _controller.textoController.text = "";
                            });
                          }
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}