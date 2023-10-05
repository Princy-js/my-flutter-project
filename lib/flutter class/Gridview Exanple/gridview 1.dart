import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: GridView1(),
  ));
}
class GridView1 extends StatelessWidget {
  const GridView1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gridview1"),
      ),
      body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
      children: List.generate(27,
              (index) => Card(
                color: Colors.primaries[index % Colors.primaries.length],
                child: Icon(Icons.accessibility_outlined),
              )),


    //     gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 120),
    //          children: List.generate(27,
    //                 (index) => Card(
    //          color: Colors.primaries[index % Colors.primaries.length],
    //          child: Icon(Icons.accessibility_outlined),

    )
    );
  }
}
