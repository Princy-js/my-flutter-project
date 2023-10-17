
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Custom_SliverEx(),
  ));
}
class Custom_SliverEx extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: CustomScrollView(
       /// required property = slivers
       slivers: [
         SliverAppBar(
           floating: true,
           pinned: true,
           title: Text("Sliver Example"),

           bottom: AppBar(
             elevation: 0,
             title: Container(
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.all(Radius.circular(30))
               ),
               width: double.infinity,
               height: 40,
               child: TextField(
                 decoration: InputDecoration(
                   border: InputBorder.none,
                   hintText: "search",
                   suffixIcon: Icon(Icons.camera_alt_outlined),
                   prefixIcon: Icon(Icons.search)
                 ),
               ),
             ),
           ),
         ),
         SliverList(
           delegate: SliverChildBuilderDelegate(
                   (context, index) => Card(
                     child: ListTile(
                       leading: Icon(Icons.cabin_outlined),
                       title: Text("Name"),
                       subtitle: Text("8086998483"),
                     ),
                   )
           ),
         )
       ],
     ),
   );
  }

}