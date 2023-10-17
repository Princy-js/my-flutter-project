import 'package:flutter/material.dart';
import 'package:new_flutter_project_class/flutter%20class/Gridview%20Exanple/gridview%203.dart';
import 'package:new_flutter_project_class/flutter%20class/Gridview%20Exanple/gridview%205.dart';

import 'custom_sliver.dart';
import 'fi_atm_card.dart';

void main(){
  runApp(MaterialApp(
    home: Btm_Bar(),
  ));
}
class Btm_Bar extends StatefulWidget {


  @override
  State<Btm_Bar> createState() => _Btm_BarState();
}

class _Btm_BarState extends State<Btm_Bar> {
  int index = 0;
  var screens = [
    FiAtmCard(),
    GridView5(),
    GridView3(),
    Custom_SliverEx(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /// in bottom navigation property we can use any widget not only BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        ///there are two types of bottomnavigationbar
        ///1.BottomNavigationBarType.fixed
        ///2.BottomNavigationBarType.shifting
        // type: BottomNavigationBarType.fixed ,
        //   backgroundColor: Colors.pink,
        //   selectedItemColor: Colors.blueAccent,
        type: BottomNavigationBarType.shifting,

          // currentIndex: 1,  ///this means which item should be selected initially viewing the page
         currentIndex: index,
          onTap: (tapedindex){
          setState(() {
            index = tapedindex;//here index vallue change according to each tap
          });
         },
          items: [
        BottomNavigationBarItem(
          backgroundColor: Colors.green,
          /// here icons is a required widget
            icon: Icon(Icons.home),label: "home"),
            BottomNavigationBarItem(
                backgroundColor: Colors.yellow,
                icon: Icon(Icons.movie_creation_outlined),label: "reels"),
            BottomNavigationBarItem(
                backgroundColor: Colors.purple,
                icon: Icon(Icons.notifications),label: "notify"),
            BottomNavigationBarItem(
                backgroundColor: Colors.greenAccent,
                icon: Icon(Icons.account_circle),label: "profile")
      ]),
      body: screens[index],
    );
  }
}
