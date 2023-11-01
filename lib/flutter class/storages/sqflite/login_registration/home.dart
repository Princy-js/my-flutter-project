import 'package:flutter/material.dart';

class HomePageSQL extends StatelessWidget {
  final data;

  const HomePageSQL({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var name = data[0]['name'];
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome $name',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
            Image(image: AssetImage('assets/images/welcome.png')),
            SizedBox(
              height: 20,
            ),
            Text(
              'You are successfully logged in!!!',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
            )
          ],
        ),
      ),
    );
  }
}
