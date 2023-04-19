import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AjudaPage extends StatefulWidget {
  @override
  _AjudaPageState createState() => _AjudaPageState();
}

class _AjudaPageState extends State<AjudaPage> {

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: "p8qz-hNzC4A",
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    )
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromARGB(247, 247, 107, 107),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text('Ajuda'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Olá! Abaixo temos um vídeo explicativo para te mostrar todas" +
                "as funcionalidades do app e como navegar entre elas",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700]
                )
              ),
            ),
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.pink,
            ),
            FlatButton(
              child: Text("   VOLTAR   "),
              padding: EdgeInsets.all(12),
              textColor: Colors.white,
              color: Colors.blue[900],
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}