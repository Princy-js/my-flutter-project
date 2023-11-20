import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_flutter_project_class/flutter%20class/storages/fireBase_example/firebase_Ex/firebase_helper.dart';
import 'package:new_flutter_project_class/flutter%20class/storages/fireBase_example/firebase_Ex/login.dart';



class Home_Firbase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("WELCOME !!" ,style: GoogleFonts.adventPro(
                fontSize:24,fontWeight:FontWeight.bold

            ),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () {
                  Firebase_Helper().logout().then((value) => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login_Firebase())));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                color: Colors.purple,
                child: Text("Logout"),
              ),
            )
          ],
        ),
      ),
    );
  }
}