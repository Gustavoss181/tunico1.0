import 'package:flutter/material.dart';
import 'package:tunico/controllers/home_controller.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = new HomeController();

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados(){
    // _controller.atualizarItens().then((value) {
    //   setState(() {});
    // });
  }

  void pesquisar(){
    // _controller.pesquisar().then((value) {
    //   setState(() {});
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart, color: Colors.white),
            SizedBox(width: 5),
            Text('Shop List App', style: TextStyle(color: Colors.white))
          ],
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.account_box, color: Colors.white),
              onPressed: () {
                _controller.gerenciarConta(context);
              }),
          IconButton(
              icon: Icon(Icons.exit_to_app, color: Colors.white),
              onPressed: () {
                _controller.sair(context);
              })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          _controller.criarNovoItem(context);
          carregarDados();
        },
      ),
      // body: RefreshIndicator(
      //   onRefresh: () async {
      //     carregarDados();
      //   },
      //   child: ListView.builder(
      //     itemCount: _controller.itens.length+1,
      //     itemBuilder: (context, index) {
      //       if(index == 0){
      //         return Padding(
      //           padding: EdgeInsets.all(20),
      //           child: TextFormFieldExt(
      //             textInputType: TextInputType.emailAddress,
      //             prefixIcon: Icon(Icons.search),
      //             hintText: 'Pesquisar',
      //             controller: _controller.pesquisaController,
      //             onChanged: (String _controller) {
      //               pesquisar();
      //             },
      //           ),
      //         );
      //       }
      //       var item = _controller.itens[index-1];
      //       return CardItem(
      //         image: Image.network(item.foto),
      //         nome: item.nome,
      //         unidades: item.unidades,
      //         valor: item.valor,
      //         uid: item.id,
      //         urlImage: item.foto,
      //         onDelete: (uid) {
      //           _controller.excluirItem(uid);
      //         },
      //         onRefresh: () {
      //           carregarDados();
      //         },
      //       );
      //     }
      //   ),
      // ),
    );
  }
}