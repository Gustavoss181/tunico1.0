import 'package:bicjr_app/data/models/postagem_model.dart';
import 'package:bicjr_app/data/providers/cloud_firestore_provider.dart';
import 'package:bicjr_app/data/providers/fire_base_auth_provider.dart';
import 'package:bicjr_app/data/providers/post_provider.dart';

class PostRepository {
  final _provider = PostProvider();
  final _cfsp = CloudFireStoreProvider();
  final _auth = new FireBaseAuthProvider();

  Future<void> incluir(String colecao, PostModel post) async {
    String currentUserId = _auth.getUserAuthData()['id'];
    post.idUser = currentUserId;

    if (post.filePath != null && !post.filePath.contains('http') && post.filePath != "" && colecao != "postagensVideoAulas")
      post.filePath = await _cfsp.uploadFile(post.filePath, Categoria().post);

    await _provider.incluir(colecao, post.toMap());
  }

  Future<void> alterar(PostModel post) async {
    await _provider.alterar(post.toMap());
  }

  Future<void> excluir(String colecao, String idPost) async {
    //arrumar
    await _provider.excluir(colecao, idPost);
  }

  Future<List<PostModel>> listarPosts(String colecao, int ref) async {
    var mapa = await _provider.listarPosts(colecao, ref);

    if(mapa == null) return [];

    var lista = List<PostModel>();
    var listaIdPosts = mapa['ids'];
    var listaPosts = mapa['posts'];

    for (var i=0; i<listaPosts.length; i++) {
      var post = PostModel.fromMap(listaPosts[i]);
      post.idPost = listaIdPosts[i];
      lista.add(post);
    }

    return lista;
  }
}