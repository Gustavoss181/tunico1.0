import 'package:bicjr_app/data/providers/fire_base_auth_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UsuarioProvider{

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final _auth = FireBaseAuthProvider();

  //incluir
  Future<void> incluir(String userAuthId, Map map) async{
    await _firestore.collection('usuarios').doc(userAuthId).set(map);
  }

  //excluir
  Future<void> excluir(String idUser) async {
    await _firestore.collection('usuarios').doc(idUser).delete();
  }

  //selecionar
  Future<Map> getUserData(String userId) async {
    var ds = await _firestore
      .collection('usuarios')
      .doc(userId)
      .get();
    
    return ds != null ? ds.data() : [];
  }

  //alterar
  Future<void> alterar(Map map) async {
    await _firestore.collection('usuarios').doc(_auth.getUserAuthData()['id']).update(map);
  }

  Future<void> adicionarAgenda(String idAgenda) async {
    await _firestore.collection('usuarios')
      .doc(_auth.getUserAuthData()['id'])
      .update({
        'agendas': FieldValue.arrayUnion([idAgenda])
      });
  }

  Future<void> retirarAgenda(String idAgenda) async {
    await _firestore.collection('usuarios')
      .doc(_auth.getUserAuthData()['id'])
      .update({
        'agendas': FieldValue.arrayRemove([idAgenda])
      });
  }
}