import 'package:flutter/cupertino.dart';
import 'package:tunico/data/providers/fire_base_auth_provider.dart';
import 'package:tunico/routes/app_routes.dart';

class HomeController{
  // final _itemRepository = new ItemRepository();
  // final pesquisaController = TextEditingController();
  // List<ItemModel> itens = new List<ItemModel>();
  // List<ItemModel> _listaItens = new List<ItemModel>();

  void gerenciarConta(BuildContext context){
    Navigator.of(context).pushNamed(AppRoutes.CONTA);
  }

  void sair(BuildContext context){
    final auth = new FireBaseAuthProvider();
    auth.efetuarLogoff();
    Navigator.of(context).pushReplacementNamed(AppRoutes.LOGIN);
  }

  void criarNovoItem(BuildContext context){
    Navigator.of(context).pushNamed(AppRoutes.ITEM);
  }

  // Future<void> atualizarItens() async {
  //   print("Atualizar itens");
  //   _listaItens = await _itemRepository.selecionarTodos();
  //   pesquisar();
  // }

  // void excluirItem(String uid) async {
  //   await _itemRepository.excluir(new ItemModel(id: uid));
  // }

  // Future<void> pesquisar() async{
  //   itens.clear();
  //   if (pesquisaController.text == ""){
  //     for (int i = 0; i < _listaItens.length; i++) {
  //       print(i);
  //       itens.add(_listaItens[i]);
  //     }
  //   }
  //   else {
  //     print("Pesquisa");
  //     print(_listaItens.length);
  //     for (int i = 0; i < _listaItens.length; i++) {
  //       print(i);
  //       if (_listaItens[i].nome.contains(pesquisaController.text)) {
  //         print(_listaItens[i].nome);
  //         itens.add(_listaItens[i]);
  //       }
  //     }
  //   }
  // }
}