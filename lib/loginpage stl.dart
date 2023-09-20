import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_flutter_project_class/homepage.dart';
import 'package:new_flutter_project_class/registration%20stl.dart';

// void main(){
//   runApp(
//       MaterialApp(
//         home: LoginPage(),
//       )
//   );
// }

class LoginPage extends StatelessWidget{
  String username = "admin@gmail.com";
  String password = "admin123";

  final uname_controller = TextEditingController();
  final pass_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(18.0),
          child: Column(
            children: [
              Image.asset(
                  "assets/icons/sonic-generations-icon.png",
                width: 130,
                height: 130,
              ),
              Padding(
                padding:  EdgeInsets.all(18.0),
                child: Text("My App",
                style: GoogleFonts.cabinSketch(
                  fontSize: 35,
                  fontWeight: FontWeight.w100,
                  color: Colors.blueAccent
                ),
                ),
              ),
              TextField(
              controller: uname_controller,
                decoration: InputDecoration(
                  hintText: "Username",
                  labelText:"Username",
                  helperText: "Username must be an email id",
                  prefixIcon: Icon(Icons.account_circle),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))
                  )
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                obscureText: true,
                obscuringCharacter: "*",
                controller: pass_controller,
                decoration: InputDecoration(
                    labelText:"Password",
                    hintText: "Password",
                    helperText: "Create a strong password",
                    prefixIcon: Icon(Icons.lock_person),
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))
                  )
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                if(username == uname_controller.text && password == pass_controller.text){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid username/password  or the fields are empty")));
                }
              } , child: Text("Login")),
              TextButton(onPressed: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Registration()));
              }, child:Text("Not a user ? register Here!"))
            ],
          ),
        ),
      ),
    );
  }
  
}