
import 'package:flutter/material.dart';
import 'package:new_flutter_project_class/flutter%20class/custom%20widgwts/refactoring%20widget.dart';

void main(){
  runApp(MaterialApp(home: GridViewCstmWdgt(),));
}
class GridViewCstmWdgt extends StatelessWidget {
  const GridViewCstmWdgt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Grid with refactoring widget"),),
      body: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15
          ),
      children: [
        CustomCard(image: const NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzb0QKr11MqfQb2vz6ZB4ZExwMrlY1Lem6vD9U5ZcVPBOSB0vG4ZHkqNGZbMljHcyuJdE&usqp=CAU"),
            text: "Product 1", click1: (){}, click2: (){}),
        CustomCard(image: const NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzb0QKr11MqfQb2vz6ZB4ZExwMrlY1Lem6vD9U5ZcVPBOSB0vG4ZHkqNGZbMljHcyuJdE&usqp=CAU"),
            text: "Product 2", click1: (){}, click2: (){}),
        CustomCard(image: const NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzb0QKr11MqfQb2vz6ZB4ZExwMrlY1Lem6vD9U5ZcVPBOSB0vG4ZHkqNGZbMljHcyuJdE&usqp=CAU"),
            text: "Product 3", click1: (){}, click2: (){}),
        CustomCard(image: const NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzb0QKr11MqfQb2vz6ZB4ZExwMrlY1Lem6vD9U5ZcVPBOSB0vG4ZHkqNGZbMljHcyuJdE&usqp=CAU"),
            text: "Product 4", click1: (){}, click2: (){}),
        CustomCard(image: const NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzb0QKr11MqfQb2vz6ZB4ZExwMrlY1Lem6vD9U5ZcVPBOSB0vG4ZHkqNGZbMljHcyuJdE&usqp=CAU"),
            text: "Product 5", click1: (){}, click2: (){}),
        CustomCard(image: const NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzb0QKr11MqfQb2vz6ZB4ZExwMrlY1Lem6vD9U5ZcVPBOSB0vG4ZHkqNGZbMljHcyuJdE&usqp=CAU"),
            text: "Product 6", click1: (){}, click2: (){})
        ],
      ),
    );
  }
}
