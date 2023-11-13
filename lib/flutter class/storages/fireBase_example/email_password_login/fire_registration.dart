import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_flutter_project_class/flutter%20class/storages/fireBase_example/email_password_login/fire_login.dart';
import 'package:new_flutter_project_class/flutter%20class/storages/fireBase_example/email_password_login/firebase_helper.dart';

class FireRegistration extends StatelessWidget {
  final R_nameContro = TextEditingController();
  final R_passContro = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FireBase Registration'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Hello, Register Here!!',
              style: GoogleFonts.hahmlet(
                  fontWeight: FontWeight.bold, fontSize: 28)),
          SizedBox(
            height: 15,
          ),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'UserName'),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Password'),
          ),
          SizedBox(
            height: 10,
          ),
          MaterialButton(
            onPressed: () {
              final email_r = R_nameContro.text.trim();
              final pass_r = R_passContro.text.trim();
              FireBase_helper()
                  .registerUser(email: email_r, paass: pass_r)
                  .then((value) {
                if (value == null) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FireLogin()));
                } else {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(value)));
                }
              });
            },
            child: Text('Register'),
            color: Colors.purple,
            height: 50,
            minWidth: 120,
          ),
        ],
      ),
    );
  }
}
