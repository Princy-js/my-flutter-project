import 'package:flutter/material.dart';


void main(){
  runApp(
      MaterialApp(
        home: StackExample(),
      ));
}
class StackExample extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("Stack Example"),
     ),
     body: Center(
       child: Stack(
         children: [
           Container(
             height: 300,
             width: 300,
             color: Colors.pink,
           ),
           Positioned(
             top: 50,
             left: 50,
             right: 50,
             bottom: 50,
             child: Container(
               height: 200,
               width: 200,
               color: Colors.purple,
             ),
           ),
           Container(
             height: 100,
             width: 100,
             color: Colors.green,
           )
         ],
       ),
     ),
   );
  }

}