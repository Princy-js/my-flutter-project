import 'package:flutter/material.dart';
import 'package:new_flutter_project_class/flutter%20class/storages/sqflite/login_registration/sqflite_registration.dart';
import 'package:new_flutter_project_class/flutter%20class/storages/sqflite/login_registration/sqflitelogin.dart';
void main(){
  runApp(MaterialApp(home: Login_Signup(),));
}
class Login_Signup extends StatefulWidget {
  const Login_Signup({Key? key}) : super(key: key);

  @override
  State<Login_Signup> createState() => _Login_SignupState();
}

class _Login_SignupState extends State<Login_Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 260.0),
                child: Text("Hello There!",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
              ),

              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
          "Automatic identity verification which enable you to verify your identity",textAlign: TextAlign.center,style: TextStyle(color: Colors.grey),),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.purple),
                      minimumSize: MaterialStateProperty.all(Size(330, 50)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Login_Form()));
                    }, child: Text("Login",style: TextStyle(color: Colors.white),)),
              ),
              SizedBox(height: 30,),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                      minimumSize: MaterialStateProperty.all(Size(330, 50)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),

                          )
                      )
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Registration_Form()));
                  }, child: Text("Sign Up",style: TextStyle(color: Colors.white),)),
            ],
          ),
        ),
      ),
    );
  }
}