import 'package:bicjr_app/data/models/postagem_model.dart';
import 'package:bicjr_app/data/models/usuario_model.dart';
import 'package:bicjr_app/views/components/foto_convert.dart';
import 'package:bicjr_app/views/pages/perfil_outros_usuarios/index.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CardVideoPost extends StatefulWidget {
  UsuarioModel user;
  PostModel post;
  Function deletar;
  String currentUserId;

  CardVideoPost({
    this.user,
    this.post,
    this.currentUserId,
    this.deletar,
  });
  @override
  _CardVideoPostState createState() => _CardVideoPostState();
}

class _CardVideoPostState extends State<CardVideoPost> {
  String pathPDF = "";

  String mostrarData(data){
    print("**********************************");
    print(widget.currentUserId);
    print(widget.user.id);
    Duration dife = DateTime.now().difference(data);
    if (dife.inMinutes < 1)
      return 'Agora';
    if (dife.inHours < 1)
      return 'Há ${dife.inMinutes} minutos atrás';
    if (dife.inDays < 1)
      return 'Há ${dife.inHours} horas atrás';
    if (dife.inDays == 1)
      return 'Ontem';
    return 'Há ${dife.inDays} dias atrás';
  }
  
  @override
  Widget build(BuildContext context) {

    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: widget.post.filePath,
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      )
    );

    return Padding(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Color.fromARGB(200, 255, 107, 107))
        ),
        elevation: 0,
        child: Column(
          children: [
            // MOSTRAR A FOTO E O NOME DO USUARIO QUE POSTOU E A DATA DA POSTAGEM
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => new OutroUsuario(widget.user)
                  )
                );
              },
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      width: 30,
                      height: 30,
                      child: ClipOval(
                        child: FotoConvert().retornaFoto(widget.user.foto)
                      )
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 130,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.user.nome,
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                        ),
                        Text(
                          mostrarData(widget.post.data.toDate()),
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10,
                          ),
                        )
                      ],
                    ),
                  ),
                  // APAGAR POST
                  if(widget.currentUserId == widget.user.id &&
                    DateTime.now().difference(widget.post.data.toDate()).inMinutes < 10)
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => widget.deletar()
                      ),
                    )
                ],
              ),
            ),
            // TEXTO DO POST
            if(widget.post.texto != null && widget.post.texto != "")
              Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: widget.post.texto,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.black
                              ),
                              recognizer: new TapGestureRecognizer()
                                ..onTap = () => launch(widget.post.texto)
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            // O VÍDEO DO POST
            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.pink,
                thumbnailUrl: "https://img.youtube.com/vi/${widget.post.filePath}/hqdefault.jpg"
              ),
            ),
          ],
        ),
      ),
    );
  }
}