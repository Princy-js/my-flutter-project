import 'package:flutter/material.dart';
import 'package:new_flutter_project_class/flutter%20class/storages/sharedpreferences/loginshared.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeShared extends StatefulWidget {
  @override
  State<HomeShared> createState() => _HomeSharedState();
}

class _HomeSharedState extends State<HomeShared> {
  late SharedPreferences prefs;
  String? user;

  @override
  void initState() {
    fetch_user();
  }

  void fetch_user() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      user = prefs.getString('uname');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome $user !'),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  prefs.setBool('firstlogin', true);

                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginShared()));
                },
                child: Text('Logout'))
          ],
        ),
      ),
    );
  }
}
