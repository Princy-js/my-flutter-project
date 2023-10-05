import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: GridView5(),
  ));
}
class GridView5 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: GridView.custom(
         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: 2),
        /// childrenDelegate: SliverChildListDelegate([]) or
         childrenDelegate: SliverChildBuilderDelegate(
                 (context, index) =>Stack(
                   children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/money.jpg"))
                        ),
                       ),
                    ),
                    const Positioned(
                      bottom: 20,
                        right: 20,
                        child: Text("50 \$",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        ),
                        )),
                     const Positioned(
                       top: 20,
                         right: 20,
                         child: Icon(
                             Icons.favorite_border,
                           color: Colors.white,
                           size: 20,
                         ))
                   ],
                 )
         )
     ),
   );
  }

}