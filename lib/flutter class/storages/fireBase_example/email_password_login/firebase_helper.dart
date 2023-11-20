import 'package:firebase_auth/firebase_auth.dart';

class FireBase_helper {
  final FirebaseAuth authh = FirebaseAuth.instance;

  //Returns the current User if they are currently signed-in, or null if not.
  get user => authh.currentUser;

  //to register user
  Future<String?> registerUser(
      {required String email, required String paass}) async {
    try {
      await authh.createUserWithEmailAndPassword(
        email: email,
        password: paass,
      );
      return null; //return null if registration is success
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return e.message;
      }
    }
  }
      //return error message if user registration is not success

     // if (e.code == 'weak-password') {
      //     print('The password provided is too weak.');
      //   } else if (e.code == 'email-already-in-use') {
      //     print('The account already exists for that email.');
      //   }
      // } catch (e) {
      //   print(e);
      // }


//login user
  Future<String?> loginUser(
      {required String emaill, required String pass}) async {
    try {
      await authh.signInWithEmailAndPassword(email: emaill, password: pass);
      return null; //return null if login is success
    } on FirebaseAuthException catch (e) {
      return e.message; //return error message if user login is not success
    }
  }

//logout user
  Future<void> logout() async {
    await authh.signOut();
  }
}
