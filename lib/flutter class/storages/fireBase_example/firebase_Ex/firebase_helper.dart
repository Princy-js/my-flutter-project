import 'package:firebase_auth/firebase_auth.dart';

class Firebase_Helper {
  // Firebase authentication check
  final FirebaseAuth auth = FirebaseAuth.instance;

  //Returns the current User if they are currently signed-in, or null if not.
  get user => auth.currentUser;

  //register user
  Future<String?> register(
      {required String email, required String password}) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
      // rturn null if rsgistraion is success
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        //catchil all exceeption verum
        return e.message; //return error mg registration i not success
      }
    }
  }
  //Login user
  Future<String?> login(
      {required String email, required String password}) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      return null;//return null if login in success
    } on FirebaseAuthException catch (e) {
      return e.message;
      //return error msg if usr login is not success
    }
  }

  //Logout
  Future<void> logout() async {
    await auth.signOut();
  }

}