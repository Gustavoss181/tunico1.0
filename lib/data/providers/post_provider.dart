import 'package:bicjr_app/data/providers/cloud_firestore_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostProvider{
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final _cfsp = CloudFireStoreProvider();

  //Incluir
  Future<void> incluir(String colecao, Map map) async {
    await _firestore.collection(colecao).add(map);
  }

  //Excluir
  Future<void> excluir(String colecao, String idPost) async {
    //deleta um único post
    if (idPost != null){
      var ds = await _firestore.collection(colecao).doc(idPost).get();
      if (ds.data()['filePath'] != null && ds.data()['filePath'] != '')
        await _cfsp.apagarArquivo(ds.data()['filePath']);
      await _firestore.collection(colecao).doc(idPost).delete();
    }
  }

  //Listar os posts na devida pagina
  Future<Map> listarPosts(String colecao, int ref) async {
    var listaIdPosts = List<String>();
    var listaPosts = List<Map>();

    var qs = await _firestore.collection(colecao)
      .where('ref', isEqualTo: ref)
      .orderBy('data', descending: true)
      .get();
    for(var post in qs.docs){
      listaIdPosts.add(post.id);
      listaPosts.add(post.data());
    }
    var mapa = Map();
    mapa['ids'] = listaIdPosts;
    mapa['posts'] = listaPosts;
    return mapa;
  }

  //Alterar
  Future<void> alterar(Map map) async {
    await _firestore.collection('postagensMaterialApoio').doc(map['id']).update(map);
  }
}