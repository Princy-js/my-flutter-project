import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Registration extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Text("Register here!",
              style: GoogleFonts.abyssinicaSil(fontSize: 30,),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: "name",
                labelText: "nameof the user",
                border: OutlineInputBorder(
                  borderRadius:BorderRadius.all(Radius.circular(50))
                )
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: "Phone",
                labelText: "Phone number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50))
                )
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: "username",
                labelText: "username",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50))
                )
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: "password",
                labelText: "password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50))
                )
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: "Re-enter password",
                labelText: "password confirmation",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50))
                )
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: (){

            }, child: Text("Register"),)
          ],
        ),
      ),
    );
  }

}