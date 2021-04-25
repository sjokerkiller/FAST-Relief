import 'package:fast_relief/models/flutterUser.dart';
import 'package:fast_relief/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on FirebaseUser
  FlutterUser _userFromFirebaseUser(User user) {
    return user != null ? FlutterUser(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<FlutterUser> get user {
    return _auth.authStateChanges()
        .map((User user) => _userFromFirebaseUser(user));
  }
  //sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      return user;
    }catch (error) {
      print(error.toString());
      return null;
    }
  }
  //register with email % password
  Future registerWithEmailAndPassword(String email, String password, String firstName,
      String lastName) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;

      //create a new document for the user with the uid
      await DatabaseService(uid: user.uid).updateUserData(firstName, lastName, 'Jumprope'
          , 'Lofi');
      return _userFromFirebaseUser(user);
    } catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e){
      print(e.toString());
      return null;
    }
  }
}