import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_flutter_project_class/flutter%20class/storages/fireBase_example/email_password_login/fire_home.dart';
import 'package:new_flutter_project_class/flutter%20class/storages/fireBase_example/email_password_login/fire_registration.dart';

import 'firebase_helper.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: 'AIzaSyCkMmTdNtDOsIIYsEy2ryKAqYi8FnHI98Q',
        appId: '1:594394372620:android:0f6c91c5101419b528ac29',
        messagingSenderId: '',
        projectId: 'flutter-project1-f3a86')
  );
  User? user = FirebaseAuth.instance.currentUser;
  runApp(MaterialApp(
    home: user == null ? FireLogin() : FireHome(),));
}
class FireLogin extends StatelessWidget {
  final L_nameContro = TextEditingController();
  final L_passContro = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FireBase Login'),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Hello, Login Here!!',style: GoogleFonts.hahmlet(fontWeight: FontWeight.bold,fontSize: 28)),
          SizedBox(height: 15,),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'UserName'
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Password'
            ),
          ),
          SizedBox(height: 10,),
          MaterialButton(
            onPressed: (){
              final email_r = L_nameContro.text.trim();
              final pass_r = L_passContro.text.trim();
              FireBase_helper().loginUser(emaill: email_r, pass: pass_r).then((value) {
                if(value == null){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>FireHome()));
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
                }
              });
            },
            child: Text('Login'),
            color: Colors.green,
            height: 50,
            minWidth: 120,
          ),
          SizedBox(height: 8,),
          TextButton(
              onPressed: (){
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context)=>
                        FireRegistration()));
              },
              child: Text('Not a user Register here!!'))
        ],
      ),
    );
  }
}
