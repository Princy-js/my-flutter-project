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
    var products = product.firstWhere((products) => products["id"] == id);

    return Scaffold(
         appBar: AppBar(
           title: Text("Product Details"),
         ),
      body: Center(
        child: Column(
          children: [
            Image.network(products['images'],width: 200,height: 200,),
            Text(products['name'],style: TextStyle(fontSize: 30),),
            Text('${products['price']}\$',style: TextStyle(fontSize: 25),),
            Text('${products['rating']}',style: TextStyle(fontSize: 20),),
            Text(products['description'],style: TextStyle(fontSize: 15),)
            
          ],
        ),
      ),
    );
  }
}
