import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: Expansion_Tile_Ex(),));
}
class Expansion_Tile_Ex extends StatelessWidget {
  const Expansion_Tile_Ex({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expansion Card"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ExpansionTile(
              title: Text("Sample colors"),
              subtitle: Text("Expand to view more"),
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.purpleAccent,
                  ),
                  title: Text("Purple"),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.pinkAccent,
                  ),
                  title: Text("Pink"),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.greenAccent,
                  ),
                  title: Text("Green"),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.redAccent,
                  ),
                  title: Text("Red"),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.orangeAccent,
                  ),
                  title: Text("Orange"),
                )
              ],
            ),


            ExpansionTile(
              title: Text("Sample text"),
              subtitle: Text("Expand to view more"),
              children: [
                ListTile(
                  leading: Text("pink",style: TextStyle(color: Colors.pink),),
                ),
                ListTile(
                  leading: Text("purple",style: TextStyle(color: Colors.purple),),
                ),
                ListTile(
                  leading: Text("blue",style: TextStyle(color: Colors.blue),),
                ),
                ListTile(
                  leading: Text("green",style: TextStyle(color: Colors.green),),
                ),
                ListTile(
                  leading: Text("red",style: TextStyle(color: Colors.red),),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
