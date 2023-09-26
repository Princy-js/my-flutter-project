import 'package:flutter/material.dart';
import 'package:new_flutter_project_class/flutter%20class/homepage.dart';
import 'package:new_flutter_project_class/flutter%20class/registration%20stf.dart';

class LoginPage2 extends StatefulWidget {
  const LoginPage2({super.key});

  @override
  State<LoginPage2> createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {
  String username = "admin@gmail.com";
  String pswd = "admin123";
  bool passwordhidden = true;
  final key1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: key1,
          child: Column(
            children: [
              Image.asset(
                  "assets/icons/sonic-generations-icon.png",
                   height: 130,
                   width: 130,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Username",
                    labelText: "username",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50))
                    )
                  ),
                  /// here the value entered at text form field will stored at uname
                  validator: (uname){

                    if(uname!.isEmpty || uname != username){
                      return 'username must not be empty / invalid';
                    }else{
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: passwordhidden,
                  obscuringCharacter: "*",
                  validator: (password){
                    if(password!.isEmpty || pswd != password){
                      return'Password must not be empty / password length must be >6';
                    }else{
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    suffixIcon: IconButton(onPressed: (){
                      setState(() {
                        if(passwordhidden == true){
                          passwordhidden = false;
                        }
                        else{
                          passwordhidden = false;
                        }
                      });
                    }
                        , icon: Icon(passwordhidden ==true?
                        Icons.visibility_off_sharp
                        :Icons.visibility)),
                      hintText: "password",
                      labelText: "password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50))
                      )
                  ),
                ),
              ),
              ElevatedButton(onPressed: (){
                final valid = key1.currentState!.validate();
                if(valid){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HomePage()));
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Invalid datas")));
                }
              }, child:Text("Login")),
              TextButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=>Registration2()));
              },
                  child:Text("Not a user? register here!"))
            ],
          ),
        ),
      ),
    );
  }
}
