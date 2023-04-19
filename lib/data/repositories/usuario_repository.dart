import 'package:bicjr_app/data/models/usuario_model.dart';
import 'package:bicjr_app/data/providers/cloud_firestore_provider.dart';
import 'package:bicjr_app/data/providers/fire_base_auth_provider.dart';
import 'package:bicjr_app/data/providers/usuario_provider.dart';

class UsuarioRepository{

  static final UsuarioProvider _provider = UsuarioProvider();
  static final _auth = new FireBaseAuthProvider();
  static final _cfsp = new CloudFireStoreProvider();

  Future<void> incluir(UsuarioModel usuario, String senha) async{
    //cria a autenticação
    var mapLogin = await _auth.criarUsuario(usuario.email, senha);
    if (mapLogin == null) return;
    //inclui a foto
    if (usuario.foto != null && !usuario.foto.contains('http') && usuario.foto != "")
      usuario.foto = await _cfsp.uploadFile(usuario.foto, Categoria().usuario);
    //inclui os dados do usuario no banco
    await _provider.incluir(mapLogin['id'], usuario.toMap());
  }

  Future<void> alterar(UsuarioModel usuario, String fotoAntiga) async{
    if(fotoAntiga != null && fotoAntiga != "")
      await _cfsp.apagarArquivo(fotoAntiga);
    if (usuario.foto != null && !usuario.foto.contains('http') && usuario.foto != "") {
      usuario.foto = await _cfsp.uploadFile(usuario.foto, Categoria().usuario);
    }
    await _provider.alterar(usuario.toMap());
  }

  Future<void> adicionarAgenda(String idAgenda) async{
    await _provider.adicionarAgenda(idAgenda);
  }

  Future<void> excluir(String foto, String senha) async{
    //login novamente para excluir
    String email = _auth.getUserAuthData()['email'];
    Map userAuthData = await _auth.efetuarLoginEmailSenha(email, senha);
    if (userAuthData == null) return;
    //id usuario
    String idUser = userAuthData['id'];

    //apagar foto do usuario
    if(foto != null && foto != '')
      await _cfsp.apagarArquivo(foto);
    
    //apagar dados do usuario no banco
    await _provider.excluir(idUser);

    //apagar credenciais de autenticação
    await _auth.apagarUsuario();
  }

  Future<UsuarioModel> getUserData({String userId}) async{
    if (userId == null)
      userId = _auth.getUserAuthData()['id'];
    
    var map = await _provider.getUserData(userId);
    return map == null ? null : UsuarioModel.fromMap(map);
  }
}