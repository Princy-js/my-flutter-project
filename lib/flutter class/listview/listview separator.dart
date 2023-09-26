import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 void main(){
   runApp(MaterialApp(
     home: ListView_Separated(),
   ));
 }
class ListView_Separated extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView.separator"),
      ),
      body: ListView.separated(
          itemBuilder: (ctx,i){
            return const Card(
              child: Text("MyData"),
              // Image.asset("path")
            );
          },
          separatorBuilder: (context,index){
            if(index % 4 == 0){
              return Divider(
                // color: Colors.redAccent,
                color: Colors.primaries[index % Colors.primaries.length],
                thickness: 3,);
            }else{
              return SizedBox();
            }
          },
          itemCount: 50)
    );
  }
}
