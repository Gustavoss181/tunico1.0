import 'package:bicjr_app/routes/app_routes.dart';
import 'package:bicjr_app/views/components/button_navigator.dart';
import 'package:bicjr_app/views/components/menu_drawer.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromARGB(247, 247, 107, 107),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Icon(
          Icons.home,
          size: 30,
        ),
        elevation: 0,
      ),
      drawer: MenuDrawer(),
      body: Center(
        child: ListView(
          children: [
            ButtonNavigator(
              cor: Colors.red[600],
              icon: Icons.ac_unit,//Icons.auto_stories,
              text: 'Língua Portuguesa: leitura literária',
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.CONTEUDOS, arguments: {"ref": 1});
              },
            ),
            ButtonNavigator(
              cor: Colors.green[700],
              icon: Icons.description,
              text: 'Língua Portuguesa: leitura não literária',
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.CONTEUDOS, arguments: {"ref": 2});
              },
            ),
            ButtonNavigator(
              cor: Colors.orange[700],
              icon: Icons.translate,
              text: 'Língua Estrangeira: Espanhol',
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.CONTEUDOS, arguments: {"ref": 3});
              },
            ),
            ButtonNavigator(
              cor: Colors.blueAccent,
              icon: Icons.chat_bubble_outline,
              text: 'Língua Estrangeira: Inglês',
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.CONTEUDOS, arguments: {"ref": 4});
              },
            ),
          ],
        ),
      ),
    );
  }
}
