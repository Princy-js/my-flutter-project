import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: ListView_Builder(),
  ));
}
class ListView_Builder extends StatelessWidget{

  var images = [
    "assets/images/bananas.png",
    "assets/images/bibimbap.png",
    "assets/images/donut.png",
    "assets/images/grapes.png",
    "assets/images/hamburger.png",
    "assets/images/orange.png",
    "assets/images/pineapple.png",
    "assets/images/pizza.png",
    "assets/images/ramen.png",
    "assets/images/salad.png",
  ];
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("Listview Builder"),
     ),
     ///ListView Builder is used when the number children were uncountable
     body: ListView(
       children:[
         ListTile(
           leading: CircleAvatar(
               child: Icon(
                 Icons.link_rounded,
                 ),
             backgroundColor: Colors.teal,
           ),
           title: Text("Create a call"),
           subtitle: Text("share link"),
         ),
         Padding(
           padding: const EdgeInsets.only(left: 20.0),
           child: Text("Recent"),
         ),
         ListView.builder(
           physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
           itemBuilder: (context,index){
         return Card(
           child: ListTile(
             title: Text("hello"),
             subtitle: Row(
               children: [
                 Icon(Icons.call_missed,
                   color: Colors.red,),
                 Text("8976543212"),
                 Text("10.30")
               ],
             ),
             leading:Image.asset(images[index]),
             trailing: Icon(Icons.call_outlined),
           ),
         );
       }),
       ]
     ),
   );
  }

}