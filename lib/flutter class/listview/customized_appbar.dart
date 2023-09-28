import 'package:flutter/material.dart';
import 'package:new_flutter_project_class/flutter%20class/listview/listview%202%20stl.dart';
import 'package:new_flutter_project_class/flutter%20class/listview/listview%20constructor.dart';

import 'listview builder.dart';
import 'listview separator.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Customized_Appbar1(),
  ));
}
class Customized_Appbar1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

   return DefaultTabController(
     length: 4, ///required property of default tab controller
     child: Scaffold(
       appBar: AppBar(
         title: Text("WhatsApp"),
         backgroundColor: Colors.teal,
         actions: [
           Icon(Icons.camera_alt_outlined),
           SizedBox(width: 15),
           Icon(Icons.search),
           ///Menu button
           PopupMenuButton(itemBuilder: (context){
            return  [
              PopupMenuItem(child: Text("New Broadcast")),
              PopupMenuItem(child: Text("New Group")),
              PopupMenuItem(child: Text("Linked devices")),
              PopupMenuItem(child: Text("Starred messages")),
              PopupMenuItem(child: Text("Payments")),
              PopupMenuItem(child: Text("settings"))
            ];
           })
         ],
         bottom: PreferredSize(preferredSize: Size.fromHeight(AppBar().preferredSize.height),
             child: Container(
               child: const TabBar(
                 // isScrollable: true,
                   tabs: [
                     Tab(
                       icon: Icon(Icons.groups),
                     ),
                     Tab(
                       text: "Chats",
                     ),
                     Tab(
                       text: "Updates",
                     ),
                     Tab(
                       text: "Calls",
                     )
                   ]),
             )),
       ),
       body: TabBarView(
           children: [
             ListView1(),
             ListView3(),
             ListView_Builder(),
             ListView_Separated()
           ]),
     ),
   );
  }

}