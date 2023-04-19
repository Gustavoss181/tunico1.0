import 'package:bicjr_app/data/providers/fire_base_auth_provider.dart';
import 'package:bicjr_app/routes/app_routes.dart';
import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  final _auth = new FireBaseAuthProvider();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: Colors.blue[900],
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 90,
                      margin: EdgeInsets.only(top: 40, bottom: 20),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: AssetImage('assets/images/graduation.png'),
                        fit: BoxFit.fill,
                        )
                      ),
                    ),
                    Text('NOME DO APP', style: TextStyle(fontSize:22, color: Color.fromARGB(247, 247, 107, 107), fontWeight: FontWeight.bold),),
                    Text('Frasezinha que representa o app', style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top:5),
              child: Column(
                 children: <Widget>[
                   ListTile(
              leading: Icon(Icons.ac_unit, color: Colors.red[600],),
              title: Text("Língua Portuguesa: leitura literária", style: TextStyle(fontSize: 15),),
              onTap: (){
                Navigator.of(context).pushNamed(AppRoutes.CONTEUDOS, arguments: {"ref": 1});
              },
            ),
            ListTile(
              leading: Icon(Icons.description, color: Colors.green[700],),
              title: Text("Língua Portuguesa: leitura não literária", style: TextStyle(fontSize: 15),),
              onTap: (){
                Navigator.of(context).pushNamed(AppRoutes.CONTEUDOS, arguments: {"ref": 2});
              },
            ),
            ListTile(
              leading: Icon(Icons.translate, color: Colors.orange[700],),
              title: Text("Língua Estrangeira: Espanhol", style: TextStyle(fontSize: 15),),
              onTap: (){
                Navigator.of(context).pushNamed(AppRoutes.CONTEUDOS, arguments: {"ref": 3});
              },
            ),
            ListTile(
              leading: Icon(Icons.chat_bubble_outline, color: Colors.blueAccent,),
              title: Text("Língua Estrangeira: Inglês", style: TextStyle(fontSize: 15),),
              onTap: (){
                Navigator.of(context).pushNamed(AppRoutes.CONTEUDOS, arguments: {"ref": 4});
              },
            ),
            Divider(height: 0, color: Colors.blue[900],),
                 ],
              ),
            ),
            
            Container(
              padding: EdgeInsets.only(top:5),
              child: Column(
                 children: <Widget>[
                  ListTile(
              leading: Icon(Icons.person),
              title: Text("Perfil", style: TextStyle(fontSize: 15),),
              onTap: (){
                Navigator.of(context).pushNamed(AppRoutes.PERFIL);
              },
            ),
            ListTile(
              leading: Icon(Icons.help_outline),
              title: Text("Ajuda", style: TextStyle(fontSize: 15),),
              onTap: (){
                Navigator.of(context).pushNamed(AppRoutes.AJUDA);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Sair", style: TextStyle(fontSize: 15),),
              onTap: (){
                try{
                  _auth.efetuarLogoff();
                  Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.TELAINICIAL, (route) => false);
                }
                catch (ex) {
                  print('******* ERRO *******');
                  print(ex.toString());
                }
              },
            ),
            // APAGAR
            ListTile(
              leading: Icon(Icons.adb),
              title: Text("Tela para Testes", style: TextStyle(fontSize: 15),),
              onTap: (){
                Navigator.of(context).pushNamed(AppRoutes.TESTES);
              },
            ),
                 ],
              ),
            ),
            
          ],
        )
      );
  }
}