import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main(){
  runApp(MaterialApp(home: Stagg_GridEx(),));
}
class Stagg_GridEx extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Staggered GridView"),
      ),
      body: SingleChildScrollView(
        child: StaggeredGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 10,
           crossAxisSpacing: 10,
          children: const [
            StaggeredGridTile.count(
                crossAxisCellCount: 3,
                mainAxisCellCount: 1,
                child: Card(
                  color: Colors.redAccent,
                  child: Center(
                    child: Icon(Icons.ac_unit_sharp),
                  ),
                )
            ),
            StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 1,
                child: Card(
                  color: Colors.lightGreenAccent,
                  child: Center(
                    child: Icon(Icons.ac_unit_sharp),
                  ),
                )
            ),
            StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 3,
                child: Card(
                  color: Colors.purpleAccent,
                  child: Center(
                    child: Icon(Icons.ac_unit_sharp),
                  ),
                )
            )
            , StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 2,
                child: Card(
                  color: Colors.redAccent,
                  child: Center(
                    child: Icon(Icons.ac_unit_sharp),
                  ),
                )
            )
            , StaggeredGridTile.count(
                crossAxisCellCount: 1,
                mainAxisCellCount: 2,
                child: Card(
                  color: Colors.blueAccent,
                  child: Center(
                    child: Icon(Icons.ac_unit_sharp),
                  ),
                )
            ),
            StaggeredGridTile.count(
                crossAxisCellCount: 3,
                mainAxisCellCount: 1,
                child: Card(
                  color: Colors.yellowAccent,
                  child: Center(
                    child: Icon(Icons.ac_unit_sharp),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }

}