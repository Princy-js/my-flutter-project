import 'package:flutter/material.dart';
import 'package:new_flutter_project_class/flutter%20class/storages/sharedpreferences/homeshared.dart';
import 'package:new_flutter_project_class/flutter%20class/storages/sharedpreferences/registration.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MaterialApp(
    home: LoginShared(),
  ));
}

class LoginShared extends StatefulWidget {
  @override
  State<LoginShared> createState() => _LoginSharedState();
}

class _LoginSharedState extends State<LoginShared> {
  final uname = TextEditingController();
  final pass = TextEditingController();
  bool? newuser;
  late SharedPreferences prefs;

  @override
  void initState() {
    check_user_alreadyLogin();
    super.initState();
  }

  void check_user_alreadyLogin() async {
    prefs = await SharedPreferences.getInstance();
    // if value of firstlogin is null newuser is true else it is false
    newuser = prefs.getBool('firstlogin')!;
    // newuser = prefs.getBool('firstlogin') ?? true;
    //newuser null aavan chance undu so,null check kodukkanam

    if (newuser == false) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeShared()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              controller: uname,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Username'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: TextField(
              controller: pass,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Password'),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
              onPressed: () async {
                prefs = await SharedPreferences.getInstance();
                //getting values from registration page
                String storeduname = prefs.getString('uname')!;
                String storedpass = prefs.getString('pass')!;

                String username_l = uname.text;
                String password_l = pass.text;

                prefs.setBool('firstlogin', false);

                if (storeduname == username_l && storedpass == password_l) {
                  ///first login false, that means the user is already logged in
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeShared()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Invalid username or password')));
                }
              },
              child: const Text('Login')),
          SizedBox(height: 30,),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RegistrationShared()));
              },
              child: const Text('Go to registration page'))
        ],
      ),
    );
  }
}
