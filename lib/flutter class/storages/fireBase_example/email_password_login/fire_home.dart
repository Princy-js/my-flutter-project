import 'package:flutter/material.dart';
import 'package:new_flutter_project_class/flutter%20class/storages/fireBase_example/email_password_login/fire_login.dart';
import 'package:new_flutter_project_class/flutter%20class/storages/fireBase_example/email_password_login/firebase_helper.dart';

class FireHome extends StatelessWidget {
  const FireHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(onPressed: () {
          FireBase_helper().logout().then((value) => Navigator.push(
              context, MaterialPageRoute(builder: (context) => FireLogin())));
        },
        color: Colors.blueAccent,
          shape: StadiumBorder(),
          height: 50,
          minWidth: 120,
          child: Text('SIGN OUT'),
        ),
      ),
    );
  }
}
