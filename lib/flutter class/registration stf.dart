import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_flutter_project_class/flutter%20class/homepage.dart';


class Registration2 extends StatefulWidget{
  @override
  State<Registration2> createState() => _Registration2State();
}

class _Registration2State extends State<Registration2> {
  final formkey = GlobalKey<FormState>(); //state monitoring of all fields
  String? pass;
  bool passwordhidden = true; //this means password hidden
  bool cnfmpasswordhidden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Page"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: Text("Register here!",
                  style: GoogleFonts.abyssinicaSil(fontSize: 30,),
                ),
              ),

              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    hintText: "Name",
                    labelText: "Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))
                    )
                ),
              ),
              SizedBox(height: 20),
              TextFormField(

                decoration: InputDecoration(
                    hintText: "username",
                    labelText: "username",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))
                    )
                ),
                validator: (username){
                  if(username!.isEmpty ||
                     !username.contains('@')||
                     !username.contains('.com')
                  ){
                    return 'username must not be empty / invalid';
                  }else{
                    return null;
                  }
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "Phone",
                    labelText: "Phone number",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))
                    )
                ),
                validator: (num){
                  if(num!.isEmpty || num.length != 10){
                    return'Phone number should have 10 digits/ must not be null';
                  }else{
                    return null;
                  }
                },
              ),
              SizedBox(height: 20),

              TextFormField(
                obscureText:passwordhidden ,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          if(passwordhidden == true){
                            passwordhidden = false;
                          }
                          else{
                            passwordhidden = true;
                          }
                        });
                      },
                      icon: Icon(passwordhidden == true ?
                      Icons.visibility_off :Icons.visibility)),
                    hintText: "password",
                    labelText: "password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))
                    )
                ),

                validator: (password){
                  pass = password;
                  if(password!.isEmpty || password.length < 6){
                    return'Password mudt not be empty / password length must be > 6';
                  }
                  else{
                    return null;
                  }
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                obscureText:cnfmpasswordhidden ,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          if(cnfmpasswordhidden == true){
                            cnfmpasswordhidden = false;
                          }
                          else{
                            cnfmpasswordhidden = true;
                          }
                        });
                      },
                      icon: Icon(cnfmpasswordhidden == true?
                      Icons.visibility_off
                      :Icons.visibility)),
                    hintText: "Re-enter password",
                    labelText: "password confirmation",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))
                    )
                ),
                validator: (cpass){
                  if(cpass!.isEmpty || cpass != pass){
                    return 'password must be same / field must not be empty';
                  }else{
                    return null;
                  }
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: (){
                final valid = formkey.currentState!.validate();
                if(valid){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HomePage()));
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Invalid datas")));
                }
              }, child: Text("Register"),)
            ],
          ),
        ),
      ),
    );
  }
}