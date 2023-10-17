import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main(){
  runApp(MaterialApp(home: Stagg_Grid_2(),));
}
class Stagg_Grid_2 extends StatelessWidget {
  const Stagg_Grid_2({super.key});

  @override
  Widget build(BuildContext context) {

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
      "assets/images/salad.png"
    ];

    var cac = [2,3,4,4,3,2,2,3,4,3];
    var mac = [2,3,1,4,2,2,4,3,5,3];
    return Scaffold(
      appBar: AppBar(
        title: Text("Staggered GridView"),
      ),
      body: SingleChildScrollView(
        child: StaggeredGrid.count(
            crossAxisCount: 4,
            children: List.generate(10, (index) => StaggeredGridTile.count(
              crossAxisCellCount: cac[index],
              mainAxisCellCount: mac[index],
              child: Card(
                color: Colors.primaries[index % Colors.primaries.length],
                child: Image.asset(images[index]),
              ),
            )),
        ),
      ),
    );
  }
}
