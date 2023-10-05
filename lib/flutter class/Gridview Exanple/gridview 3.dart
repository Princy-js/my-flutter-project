import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: GridView3(),
  ));
}
class GridView3 extends StatelessWidget{
  var title = [
    "food1",
    "food2",
    "food3",
    "food4",
    "food5",
    "food6",
    "food7",
    "food8",
    "food9",
    "food10",
  ];
  var subtitle = ["10 \$","20 \$","30 \$","40 \$","50 \$","60 \$","70 \$","80 \$","90 \$","09 \$"];
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
     body: Padding(
       padding: const EdgeInsets.all(8.0),
       child: GridView.count(
         crossAxisCount: 3,
       crossAxisSpacing: 10,
       mainAxisSpacing: 10,
       children:
         List.generate(
             10,
                 (index) =>Container(
                   width: 300,
                   height: 300,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.all(Radius.circular(10),),
                     color: Colors.primaries[index % Colors.primaries.length],
                   ),
                   child: Column(
                     children: [
                       Image.asset(images[index],height: 80,),
                       Text(title[index],
                       style: TextStyle(
                         fontSize: 20,
                         fontWeight: FontWeight.bold
                       ),
                       ),
                       Text(subtitle[index],
                         style: TextStyle(
                             fontSize: 10
                         ),
                       ),
                     ],
                   ),
                 ))
       ,
       ),
     ),

   );
  }

}