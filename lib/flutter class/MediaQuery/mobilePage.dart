import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MobileScreen extends StatelessWidget {
  const MobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
     appBar: AppBar(
       title: Text("Mobile"),
     ),
     body: Padding(
       padding: const EdgeInsets.all(8.0),
       child: Column(
         children: [
           //currently playing video
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: AspectRatio(
                 aspectRatio: 16 / 9,
               child: Container(
                 color: Colors.pinkAccent,
               ),
             ),
           ),
           //List of videos
           Expanded(
               child: ListView.builder(itemBuilder: (context,index){
                 return Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container(
                     color: Colors.red,
                     height: 120,
                   ),
                 );
               },
                 itemCount: 8,
               )
           )
         ],
       ),
     ),
    );
  }
}
