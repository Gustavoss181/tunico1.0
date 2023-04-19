import 'package:bicjr_app/controllers/video_aulas_controller.dart';
import 'package:bicjr_app/views/components/card_videoPost.dart';
import 'package:flutter/material.dart';

class VideoAulas extends StatefulWidget {
  @override
  _VideoAulasState createState() => _VideoAulasState();
}

class _VideoAulasState extends State<VideoAulas> {
  final _controller = VideoAulasPageController();
  bool controle = true;

  Future<void> controlar() async {
    controle = true;
  }

  Future<String> deletar(BuildContext context, String colecao, String idPost){
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
        backgroundColor:Color.fromARGB(247, 247, 107, 107),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text('Vídeo Aulas'),
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
                        return CardVideoPost(
                          user: user,
                          post: post,
                          currentUserId: _controller.currentUserId,
                          deletar: () => deletar(context, args["pag"], post.idPost),

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
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller.urlVideo,
                          decoration: InputDecoration.collapsed(
                            hintText: "Copie e cole um link do Youtube aqui."
                          ),
                        )
                      ),
                      IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () async{
                          if(_controller.urlVideo.text.length <= 0) return;
                          bool postado = await _controller.fazerPostagem(context, args["pag"], args["ref"]);
                          if(postado)
                            setState(() {
                              controle = true;
                              _controller.urlVideo.text = "";
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