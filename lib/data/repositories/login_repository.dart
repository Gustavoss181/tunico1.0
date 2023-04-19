import 'package:bicjr_app/data/models/login_model.dart';
import 'package:bicjr_app/data/providers/fire_base_auth_provider.dart';

class LoginRepository{

  static final _provider = FireBaseAuthProvider();

  Future<LoginModel> efetuarLogin(String email, String senha) async{
    var map = await _provider.efetuarLoginEmailSenha(email, senha);

    if (map == null) return null;

    var login = LoginModel.fromMap(map);

    return login;
  }

  Future<LoginModel> criarLogin(String email, String senha) async{
    var map = await _provider.criarUsuario(email, senha);

    if (map == null) return null;

    var login = LoginModel.fromMap(map);

    return login;
  }

  void efetuarLogoff() async{
    await _provider.efetuarLogoff();
  }
  
  void recuperarSenha(String email) async{
    await _provider.recuperarSenha(email);
  }
}