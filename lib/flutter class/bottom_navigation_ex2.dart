import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:new_flutter_project_class/flutter%20class/Gridview%20Exanple/gridview%203.dart';
import 'package:new_flutter_project_class/flutter%20class/Gridview%20Exanple/gridview%205.dart';

import 'custom_sliver.dart';
import 'fi_atm_card.dart';

void main(){
  runApp(MaterialApp(
    home: Btm_Bar2(),
  ));
}
class Btm_Bar2 extends StatefulWidget {


  @override
  State<Btm_Bar2> createState() => _Btm_Bar2State();
}

class _Btm_Bar2State extends State<Btm_Bar2> {
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
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react,
        items: [
          TabItem(icon: Icons.list),
          TabItem(icon: Icons.calendar_today),
          TabItem(icon: Icons.assessment),
          TabItem(icon: Icons.assessment),
        ],
        initialActiveIndex:  index,
        onTap: (tapedindex){
          setState(() {
            index = tapedindex;//here index vallue change according to each tap
          });
        },
      ),

      body: screens[index],
    );
  }
}
