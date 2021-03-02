import 'package:firebase_auth/firebase_auth.dart';

class FireBaseAuthProvider{

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<Map> get onAuthStateChanged => _firebaseAuth.authStateChanges().map((User currentUser) => {
          'id': currentUser.uid,
          'displayName': currentUser.displayName,
          'email': currentUser.email,
          'photoURL': currentUser.photoURL,
          'phoneNumber': currentUser.phoneNumber
        });
  //efetuar login
  Future<Map> efetuarLoginEmailSenha(String email, String senha) async{
    try{
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
    catch (ex){
      print(ex);
      return null;
    }
  }
  //criar conta
  Future<Map> criarUsuario(String email, String senha) async{
    try{
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
    catch (ex){
      print(ex);
      return null;
    }
  }
  //efetuar logoff
  Future<void> efetuarLogoff() async{
    try{
      return _firebaseAuth.signOut();
    }
    catch (ex){
      print(ex);
      return null;
    }
  }
  //recuperar senha
  Future<void> recuperarSenha(String email) async{
    try{
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    }
    catch (ex){
      print(ex);
    }
  }
}