import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCard extends StatelessWidget {
  NetworkImage? image;
  String? text;
  IconData? icon;
  VoidCallback? click1;
  VoidCallback? click2;

  CustomCard(
      {required this.image,
      required this.text,
      this.icon,
      required this.click1,
      required this.click2});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Stack(children: [
            Image(image: image!,width:double.infinity,height: 150,fit: BoxFit.cover,),
            const Positioned(
                top: 20,
                right: 20,
                child: Icon(Icons.favorite_border,color: Colors.white,))
          ]),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text!,
              style: GoogleFonts.alegreyaSans(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: click1,
                  child: Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                  )),
              ElevatedButton(onPressed: click2, child: Text("Buy Now"))
            ],
          )
        ],
      ),
    );
  }
}
