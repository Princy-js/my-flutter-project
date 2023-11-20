import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_flutter_project_class/flutter%20class/storages/fireBase_example/firebase_Ex/firebase_helper.dart';
import 'package:new_flutter_project_class/flutter%20class/storages/fireBase_example/firebase_Ex/home.dart';
import 'package:new_flutter_project_class/flutter%20class/storages/fireBase_example/firebase_Ex/register.dart';



void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
   /// if you have no oauth client details thn manually addd his value to goolesrvicce.json file file
    options:FirebaseOptions(
        apiKey: "AIzaSyCkMmTdNtDOsIIYsEy2ryKAqYi8FnHI98Q",//current_key
        appId: "1:594394372620:android:0f6c91c5101419b528ac29",//mobilesdk_app_id
        messagingSenderId: '',//null
        projectId: "flutter-project1-f3a86")//project_id
  );
  //these both usd in
  User? user =FirebaseAuth.instance.currentUser;
  runApp(
      MaterialApp(home: user == null? Login_Firebase():Home_Firbase(),
      ));
}
class Login_Firebase extends StatelessWidget {
  final L_uname=TextEditingController();
  final L_pass=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar:AppBar(title: Text("Firebase Login"),),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hello Login Here!!",style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: 20),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: L_uname,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),hintText: "username"
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: L_pass,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),hintText: "password"
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(onPressed: (){
                final email=L_uname.text.trim();
                final pass=L_pass.text.trim();
                Firebase_Helper().login(email: email, password: pass).then((value) {
                  if(value == null){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Home_Firbase()));
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));
                  }
                });
              },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text("Login"),
                color: Colors.red,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(onPressed: (){

                Navigator.push(context, MaterialPageRoute(builder: (context)=>Reg_Firebase()));
              }, child: Text("Not a user Register Here")),
            )
          ],
        )
    );
  }
}