import 'package:flutter/material.dart';

class TestesPage extends StatefulWidget {
  @override
  _TestesPageState createState() => _TestesPageState();
}

class _TestesPageState extends State<TestesPage> {

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
                // _controller.apagarUsuario(context, customController.text);
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromARGB(247, 247, 107, 107),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Icon(
          Icons.adb,
          size: 30,
        ),
        elevation: 0,
      ),
      body: Container(
        
      ),
      floatingActionButton: IconButton(
        icon: Icon(Icons.open_in_new),
        onPressed: () {
          createAlertDialog(context);
        },
      ),
    );
  }
}
