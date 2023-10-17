import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:new_flutter_project_class/flutter%20class/fi_atm_card.dart';
import 'package:new_flutter_project_class/flutter%20class/rive_animation_ex.dart';

void main(){
  runApp(MaterialApp(home: CarosalEx(),));
}
class CarosalEx extends StatelessWidget {
  const CarosalEx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carosal Example"),
      ),
      body: CarouselSlider(
          items: [
            InkWell(
              onTap: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>SimpleAnimation()));
              },
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                      image: NetworkImage("https://images.unsplash.com/photo-1686367134749-6795adf7f2ec?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1965&q=80"))
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>FiAtmCard()));
              },
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage("https://images.unsplash.com/photo-1680006152319-9bde494749f6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDQyfEpwZzZLaWRsLUhrfHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=500&q=60"    ),
              ),
                )
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage("https://images.unsplash.com/photo-1694875760881-995932213358?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDc1fEpwZzZLaWRsLUhrfHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=500&q=60"))
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage("https://images.unsplash.com/photo-1686367134749-6795adf7f2ec?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1965&q=80"))
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage("https://images.unsplash.com/photo-1694960679151-8b2da9099d0c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80"))
              ),
            )
          ],
          options: CarouselOptions(
            autoPlay: true,
            viewportFraction: .5,
            enlargeCenterPage: true,
            enableInfiniteScroll: true, //automatic play
            autoPlayCurve:Curves.easeInOutCirc,
            autoPlayAnimationDuration: const Duration(seconds: 5)
          )),
    );
  }
}
