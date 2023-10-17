import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:new_flutter_project_class/flutter%20class/stf%20splash.dart';

void main(){
  runApp(MaterialApp(home: IntroScreen(),));
}
class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ///object creation of object of pagedecoration
    PageDecoration decorationPage = PageDecoration(
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
        color: Colors.purple
      ),
      bodyTextStyle: TextStyle(
        fontSize: 20,
        fontStyle: FontStyle.italic,
        color: Colors.black
      ),
      boxDecoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Colors.white,
              Colors.yellow,
              Colors.pinkAccent])
      )

    );
    return IntroductionScreen(
      pages: [
        ///pageview model is used to create pages
        PageViewModel(
          // decoration: PageDecoration(
          //   properties
          // ),
          decoration: decorationPage,
          title: "First Page",
          body: "Introduction Screen allows you to have a"
              " screen on an app's first launch to, for example,"
              " explain your app. This widget is very customizable with a great design.",
          image: IntroImage("https://images.unsplash.com/photo-1682621034776-78c3a4854512?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDExNHxCbi1EanJjQnJ3b3x8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60")
        ),
        PageViewModel(
            decoration: decorationPage,
            title: "Second Page",
            body: "Introduction Screen allows you to have a"
                " screen on an app's first launch to, for example,"
                " explain your app. This widget is very customizable with a great design.",
            image: IntroImage("https://images.unsplash.com/photo-1681578861249-dcaf650420c1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDEyN3xCbi1EanJjQnJ3b3x8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60")
        ),
        PageViewModel(
            decoration: decorationPage,
            title: "Third Page",
            body: "Introduction Screen allows you to have a"
                " screen on an app's first launch to, for example,"
                " explain your app. This widget is very customizable with a great design.",
            image: IntroImage("https://images.unsplash.com/photo-1681411399009-775b6b7ba5a9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDEzM3xCbi1EanJjQnJ3b3x8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60")
        )
      ],
      onSkip: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Splash2())),
      onDone: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Splash2())),
      showSkipButton: true,
      skip: Text("skip"),
      // showBackButton: true,
      // back: Text("Back"), //or Icon(Icons.back_arrow)
      next: Icon(Icons.arrow_forward_rounded),
      done: Text("Done"),
      dotsDecorator: DotsDecorator(
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25))
        ) ,
        size: Size(12, 10),
        activeSize: Size(22,10),
        activeColor: Colors.green
      ),
    );
  }

  ///widget that create by the user
  Widget IntroImage(String imagepath) {
    return Align(
      alignment: Alignment.topCenter,
       child:   Container(
         decoration: BoxDecoration(
           image: DecorationImage(
             fit: BoxFit.cover,
               image:NetworkImage(imagepath)
           )
         ),
       )
      // Column(
      //   children: [
      //     Image.network(imagepath,width: double.infinity,),
      //     Text("image from custom widget")
      //   ],
      );

  }
}
