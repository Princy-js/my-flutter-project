import 'package:flutter/material.dart';

class Rgistration extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("Register here!"),
            TextField(
              decoration: InputDecoration(
                hintText: "name",
                labelText: "nameof the user",
                border: OutlineInputBorder(
                  borderRadius:BorderRadius.all(Radius.circular(50))
                )
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Phone",
                labelText: "Phone number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50))
                )
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "username",
                labelText: "username",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50))
                )
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "password",
                labelText: "password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50))
                )
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Re-enter password",
                labelText: "password confirmation",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50))
                )
              ),
            ),
            ElevatedButton(onPressed: (){

            }, child: Text("Register"),)
          ],
        ),
      ),
    );
  }

}