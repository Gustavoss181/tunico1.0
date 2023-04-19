import 'package:bicjr_app/routes/app_routes.dart';
import 'package:bicjr_app/views/components/square_button.dart';
import 'package:flutter/material.dart';

class ContentsPage extends StatefulWidget {
  @override
  _ContentsPageState createState() => _ContentsPageState();
}

class _ContentsPageState extends State<ContentsPage> {
  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments;
    String appBarTitle;
    if(args["ref"] == 1)
      appBarTitle = "Língua Portuguesa: leitura literária  ";
    else if(args["ref"] == 2)
      appBarTitle = "Língua Portuguesa: leitura não literária   ";
    else if(args["ref"] == 3)
      appBarTitle = "Língua Estrangeira: Espanhol";
    else if(args["ref"] == 4)
      appBarTitle = "Língua Estrangeira: Inglês";

    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromARGB(247, 247, 107, 107),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            appBarTitle,
            style: TextStyle(color: Colors.white),
          ),
        ),
        elevation: 0,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareButton(
                    icon: Icons.book,
                    text: 'Material de apoio',
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoutes.POSTAGENS,
                      arguments: {
                        "ref": args["ref"],
                        "pag": "postagensMaterialApoio"
                      });
                    },
                    color: Color.fromARGB(255, 66, 85, 132),
                  ),
                  SquareButton(
                    icon: Icons.play_circle_outline,
                    text: 'Vídeo aulas',
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoutes.VIDEOAULAS,
                      arguments: {
                        "ref": args["ref"],
                        "pag": "postagensVideoAulas"
                      });
                    },
                    color: Colors.teal,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareButton(
                    icon: Icons.question_answer,
                    text: 'Questões comentadas',
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoutes.QUESTOESCOMENTADAS,
                      arguments: {
                        "ref": args["ref"],
                        "pag": "postagensQuestoesComentadas"
                      });
                    },
                    color: Colors.red,
                  ),
                  SquareButton(
                    icon: Icons.library_books,
                    text: 'Planos de aula',
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoutes.POSTAGENS,
                      arguments: {
                        "ref": args["ref"],
                        "pag": "postagensPlanosAula"
                      });
                    },
                    color: Colors.purple,
                  ),
                ],
              ),
            ],
          ),
        ],
      ));
  }
}
