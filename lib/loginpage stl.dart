import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// void main(){
//   runApp(
//       MaterialApp(
//         home: LoginPage(),
//       )
//   );
// }

class LoginPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Image.asset(
                "assets/icons/sonic-generations-icon.png",
              width: 130,
              height: 130,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text("My App",
              style: GoogleFonts.cabinSketch(
                fontSize: 35,
                fontWeight: FontWeight.w100,
                color: Colors.blueAccent
              ),
              ),
            ),
            TextField(
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
            ElevatedButton(onPressed: (){} , child: Text("Login")),
            TextButton(onPressed: (){}, child:Text("Not a user ? login Here!"))
          ],
        ),
      ),
    );
  }
  
}