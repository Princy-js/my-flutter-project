import 'package:flutter/material.dart';

class LoginPage2 extends StatefulWidget {
  const LoginPage2({super.key});

  @override
  State<LoginPage2> createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
                if(uname!.isEmpty || !uname.contains('@') || !uname.contains('.com')){
                  return 'username must not be empty / invalid';
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              validator: (password){
                if(password!.isEmpty || password.length<6){
                  return'Password must not be empty / password length must be >6';
                }
              },
              decoration: InputDecoration(
                  hintText: "password",
                  labelText: "password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50))
                  )
              ),
            ),
          ),
          ElevatedButton(onPressed: (){}, child:Text("Login"))
        ],
      ),
    );
  }
}
