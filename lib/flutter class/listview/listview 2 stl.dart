import 'package:flutter/material.dart';

void main(){
  runApp(
      MaterialApp(
        home: ListView3(),
      )
  );
}
class ListView3 extends StatelessWidget {
  var title = [
    "Data1",
    "Data2",
    "Data3",
    "Data4",
    "Data5",
    "Data6",
    "Data7",
    "Data8",
    "Data9",
    "Data10",
  ];
  var subtitle = [10,20,30,40,50,60,70,80,90,09];
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

  var icons = [
    Icon(Icons.add),
    Icon(Icons.add_shopping_cart),
    Icon(Icons.add),
    Icon(Icons.add_shopping_cart),
    Icon(Icons.add),
    Icon(Icons.add_shopping_cart),
    Icon(Icons.add),
    Icon(Icons.add_shopping_cart),
    Icon(Icons.add),
    Icon(Icons.add_shopping_cart)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listview2"),
      ),
      body: ListView(
        children: List.generate(10, (index) => Card(
          child: ListTile(
            title: Text(title[index]),
            subtitle: Text('${subtitle[index]}'),
            leading:Image.asset(images[index]),
            // trailing:Icon(icons[index]),
            trailing: Icon(Icons.shopping_cart_outlined,),
          ),
        )),
      ),
    );
  }
}
