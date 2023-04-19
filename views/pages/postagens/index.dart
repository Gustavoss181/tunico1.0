import 'package:bicjr_app/controllers/postagens_controller.dart';
import 'package:bicjr_app/views/components/card_post.dart';
import 'package:bicjr_app/views/components/common_example_wrapper.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PostagensPage extends StatefulWidget {
  @override
  _PostagensPageState createState() => _PostagensPageState();
}

class _PostagensPageState extends State<PostagensPage> {
  final _controller = PostagensPageController();
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

  expandirImagem(BuildContext context, String urlImage){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CommonExampleRouteWrapper(
          imageProvider: NetworkImage(
            urlImage,
          ),
          loadingBuilder: (context, event) {
            if (event == null) {
              return const Center(
                child: Text("Loading"),
              );
            }

            final value = event.cumulativeBytesLoaded /
                (event.expectedTotalBytes ??
                    event.cumulativeBytesLoaded);

            final percentage = (100 * value).floor();
            return Center(
              child: Text("$percentage%"),
            );
          },
        ),
      ),
    );
  }

  escolherArquivo(valor) async {
    if(valor == 0){
      await imagePicker.getImage(source: ImageSource.gallery)
      .then((result){
        if (result != null) {
          setState(() {
            controle = false;
            _controller.filePath = result.path;
          });
        }
      });
    }
    else if(valor == 1){
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
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(args["pag"] == 'postagensMaterialApoio' ? 'Material de apoio' : 'Planos de Aula'),
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
                        return CardPost(
                          user: user,
                          post: post,
                          currentUserId: _controller.currentUserId,
                          deletar: () => createAlertDialog(context, args['pag'], post.idPost),
                          expandirImagem: () => expandirImagem(context, post.filePath),
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
                      PopupMenuButton<int>(
                        icon: Icon(Icons.attach_file),
                        offset: Offset(0, -120),
                        elevation: 0,
                        color: Colors.transparent,
                        itemBuilder: (context) => <PopupMenuEntry<int>>[
                          const PopupMenuItem<int>(
                            child: Icon(Icons.photo),
                            value: 0,
                          ),
                          const PopupMenuItem<int>(
                            child: Icon(Icons.picture_as_pdf),
                            value: 1,
                          )
                        ],
                        onSelected: (valor) => escolherArquivo(valor)
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
                          if(_controller.textoController.text.length <= 0) return;
                          await _controller.fazerPostagem(context, args["pag"], args["ref"]);
                          setState(() {
                            controle = true;
                            _controller.filePath = null;
                            _controller.textoController.text = "";
                          });
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