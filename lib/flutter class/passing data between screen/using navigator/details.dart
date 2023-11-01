import 'package:flutter/material.dart';
import 'package:new_flutter_project_class/flutter%20class/passing%20data%20between%20screen/using%20navigator/dummydata.dart';

class Product_Details extends StatelessWidget {
  Product_Details({super.key});

  @override
  Widget build(BuildContext context) {
    ///we can access arguments from previous page
    //id from previous page
    var id = ModalRoute.of(context)?.settings.arguments;

    //product list oro map um products il varum , previous page le tap cheytha id, ee id kk matching
    //aaya id product list il undonn check cheyum , undengil aa single map products il store cheyum
    var hello = product.firstWhere((hello) => hello["id"] == id);

    return Scaffold(
         appBar: AppBar(
           title: Text("Product Details"),
         ),
      body: Center(
        child: Column(
          children: [
            Image.network(hello['images'],width: 150,height: 150,),
            Text(hello['name'],style: TextStyle(fontSize: 30),),
            Text('${hello['price']}\$',style: TextStyle(fontSize: 25),),
            Text('${hello['rating']}',style: TextStyle(fontSize: 20),),
            Text(hello['description'],style: TextStyle(fontSize: 15),)
          ],
        ),
      ),
    );
  }
}
