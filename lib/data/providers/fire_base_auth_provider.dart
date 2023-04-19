import 'package:firebase_auth/firebase_auth.dart';

class FireBaseAuthProvider {

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User> get authState => _firebaseAuth.idTokenChanges();

  Stream<Map> get onAuthStateChanged => _firebaseAuth.authStateChanges().map((User currentUser) => {
    'id': currentUser.uid,
    'displayName': currentUser.displayName,
    'email': currentUser.email,
    'photoURL': currentUser.photoURL,
    'phoneNumber': currentUser.phoneNumber
  });

  Map getUserAuthData() {
    Map map = {
      'id': _firebaseAuth.currentUser.uid,
      'displayName': _firebaseAuth.currentUser.displayName,
      'email': _firebaseAuth.currentUser.email,
      'photoURL': _firebaseAuth.currentUser.photoURL,
      'phoneNumber': _firebaseAuth.currentUser.phoneNumber,
    };
    return map;
  }

  //efetuar login
  Future<Map> efetuarLoginEmailSenha(String email, String senha) async{
    final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email, password: senha
    );
    return {
      'id': userCredential.user.uid,
      'displayName': userCredential.user.displayName,
      'email': userCredential.user.email,
      'photoURL': userCredential.user.photoURL,
      'phoneNumber': userCredential.user.phoneNumber
    };
  }
  //criar conta
  Future<Map> criarUsuario(String email, String senha) async{
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email, password: senha);
    return {
      'id': userCredential.user.uid,
      'displayName': userCredential.user.displayName,
      'email': userCredential.user.email,
      'photoURL': userCredential.user.photoURL,
      'phoneNumber': userCredential.user.phoneNumber
    };
  }
  //efetuar logoff
  Future<void> efetuarLogoff() async{
    await _firebaseAuth.signOut();
  }
  //recuperar senha
  Future<void> recuperarSenha(String email) async{
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  Future<void> apagarUsuario() async {
    await _firebaseAuth.currentUser.delete();
  }
}