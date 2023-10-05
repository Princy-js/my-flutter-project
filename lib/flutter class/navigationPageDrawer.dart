import 'package:flutter/material.dart';

// void main(){
//   runApp(MaterialApp(
//     home: NavigationPageExample(),
//   ));
// }
class NavigationPageExample extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.black,
       title: Center(
           child: Text("AppBar")),
     ),
     drawer: Drawer(),
     body: Column(
       children: [
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Container(
             width: double.infinity,
             height: 330,
             decoration: BoxDecoration(
               image: DecorationImage(
                 fit: BoxFit.cover,
                   image: AssetImage("assets/images/sundarPichai.jpg"))
             ),
           ),
         ),
         Align(
           alignment: Alignment.centerLeft,
           child: Text("Sundar Pichai",
           style: TextStyle(
             fontWeight: FontWeight.bold,
             fontSize: 20,
           ),
           ),
         ),
         Text("'Pichai began his career as a materials engineer. "
             "Following a short stint at the management consulting"
             " firm McKinsey & Co., Pichai joined Google in 2004,[9] where "
             "he led the product management and innovation efforts for a suite "
             "of Google's client software products, including Google Chrome and ChromeOS,"
             " as well as being largely responsible for Google Drive. In addition, he went"
             " on to oversee the development of other applications such as Gmail and "
             "Google Maps. In 2010, Pichai also announced the open-sourcing of the"
             " new video codec VP8 by Google and introduced the new video format, WebM."
             " The Chromebook was released in 2012.'",
         textAlign: TextAlign.justify,
         )
       ],
     ),
   );
  }
  
}