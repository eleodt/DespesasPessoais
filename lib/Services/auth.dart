import 'package:expenses/models/usuario.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Ususario _userFormFirebaseUser(FirebaseUser usuario){
    return usuario != null ? Ususario(uid: usuario.uid) : null;
  }

  
  Stream<Ususario> get user{
    return _auth.onAuthStateChanged
      .map(_userFormFirebaseUser);
  }

  //logar anonimo
  Future signInAnon() async{
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFormFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  //Logar
  Future signInWithEmailAndPassword(String email, String senha) async{
    try{
      AuthResult resultado = await _auth.signInWithEmailAndPassword(email: email.trim(), password: senha.trim());
      FirebaseUser user = resultado.user;
      return _userFormFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  //registrar com email e senha
  Future registerWithEmailESenha(String email, String senha) async{
    try{
      AuthResult resultado = await _auth.createUserWithEmailAndPassword(email: email.trim(), password: senha.trim());
      FirebaseUser user = resultado.user;
      return _userFormFirebaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }


  //Deslogar
  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
          }
  }
}
