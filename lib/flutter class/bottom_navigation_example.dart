import 'package:flutter/material.dart';

class Btm_Bar extends StatefulWidget {


  @override
  State<Btm_Bar> createState() => _Btm_BarState();
}

class _Btm_BarState extends State<Btm_Bar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.accessibility)),
            BottomNavigationBarItem(
                icon: Icon(Icons.accessibility)),
            BottomNavigationBarItem(
                icon: Icon(Icons.accessibility),label: "hello"),
            BottomNavigationBarItem(
                icon: Icon(Icons.accessibility))
      ]),
    );
  }
}
