import 'package:firebase_auth/firebase_auth.dart';
import 'package:localeyes_app/models/user.dart';

class AuthService{
  //instance of firebase authentication:

  final FirebaseAuth _auth = FirebaseAuth.instance; //underscore means private to this file

  //create user object based on firebase user:
  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid);
  }

  //auth change user stream
  Stream<User> get user{
    return _auth.onAuthStateChanged
      .map(_userFromFirebaseUser);
  }

  //sign in anonymously
  //asynchronous --> future
  Future signInAnon() async{
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e){
      print(e.toString);
      return null;
    }
  }



}