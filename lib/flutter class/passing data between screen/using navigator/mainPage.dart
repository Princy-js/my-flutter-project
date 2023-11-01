import 'package:flutter/material.dart';
import 'package:new_flutter_project_class/flutter%20class/passing%20data%20between%20screen/using%20navigator/details.dart';
import 'package:new_flutter_project_class/flutter%20class/passing%20data%20between%20screen/using%20navigator/dummydata.dart';

void main(){
  runApp(MaterialApp(home: Product_main(),
  routes: {
    "details" : (context) => Product_Details(),
    // "home"    : (context) => Home()
    ///map ayit routes(venda pages) evade kodukkam
  },
  ));
}
class Product_main extends StatelessWidget {
  const Product_main({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product"),
      ),
       body: GridView(
         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,),
         children: product.map((products) => Card(
           child: Column(
             children: [
               InkWell(
                 onTap: ()=>Navigator.pushNamed(context,"details",
                 arguments: products["id"]
                 ),
                 ///OR
                 // Navigator.of(context).pushNamed('details',arguments: products["id"])
                 child: Container(
                   height: 150,
                   decoration: BoxDecoration(
                     image: DecorationImage(
                         fit: BoxFit.contain,
                         image: NetworkImage(products["images"])
                     )
                   ),
                 ),
               ),
               Text(products["name"]),
               Text('${products["price"]}\$')
             ],
           ),
         )
         ).toList(),
       )
        
        
        
      // ListView(
      //   padding: EdgeInsets.all(15),
      //
      //   children: product.map((products) => ListTile(
      //       leading: Container(
      //         height: 100,
      //         width: 100,
      //         decoration: BoxDecoration(
      //           image: DecorationImage(
      //             fit: BoxFit.contain,
      //               image: NetworkImage(products["images"]))
      //         ),
      //       ),
      //     title: Text(products["name"]),
      //     subtitle: Text("${products["price"]}\$"),
      //   )
      //   ).toList(),
      // ),



    );
  }
}
