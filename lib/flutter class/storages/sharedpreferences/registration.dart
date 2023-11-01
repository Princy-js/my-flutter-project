import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_flutter_project_class/flutter%20class/storages/sharedpreferences/loginshared.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationShared extends StatefulWidget {


  @override
  State<RegistrationShared> createState() => _RegistrationSharedState();
}

class _RegistrationSharedState extends State<RegistrationShared> {
  final name = TextEditingController();
  final uname = TextEditingController();
  final pwd = TextEditingController();
  late  SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: name,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Name'
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: uname,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'UserName'
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: pwd,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Password'
              ),
            ),
          ),
          ElevatedButton(onPressed: () async{
            String name_of_user = name.text;
            String username = uname.text;
            String password = pwd.text;
            
            prefs = await SharedPreferences.getInstance()!;
            prefs.setString('name', name_of_user);
            prefs.setString('uname', username);
            prefs.setString('pass', password);

            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginShared()));
          },
              child: Text('Register'))
        ],
      ),
    );
  }
}
