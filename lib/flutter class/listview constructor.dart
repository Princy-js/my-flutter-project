import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.teal),
    home: ListView1(),
  ));
}
class ListView1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Listview 1"),
      ),
      body: ListView(
        children: const [
          Card(
              child: ListTile(
                leading: CircleAvatar(backgroundImage: AssetImage("assets/images/images.jpg"),),
                  title: Text("Product1"),
                  subtitle: Row(
                    children: [
                      Text("This is a sample subtitle"),
                      Icon(Icons.verified_outlined)
                    ],
                  ),
                  trailing: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("10.10"),
                      CircleAvatar(
                        minRadius: 5,
                        maxRadius: 10,
                        backgroundColor: Colors.teal,
                        child: Text("3"),
                      )
                    ],
                  ),
              )
          ),
          Card(
              child:
              ListTile(
                leading:CircleAvatar(
                  backgroundImage: AssetImage("assets/images/pexels-vlada-karpovich-4668537.jpg"),),
                title: Text("Product2"),
                subtitle: Text("This is a simple subtitle"),
                trailing: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("9.45"),
                    CircleAvatar(
                      maxRadius: 5,
                      minRadius: 10,
                      backgroundColor: Colors.teal,
                      child: Text("2"),
                    )
                  ],
                ),
                
              )),
          
          Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/pexels-daniel-xavier-1239291.jpg"),),
                  title: Text("Product3"),
                  subtitle: Text("this is a sample"),
                  trailing: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("7.01"),
                      CircleAvatar(
                        minRadius: 5,
                        maxRadius: 10,
                        backgroundColor: Colors.teal,
                        child: Text("3"),
                      )
                    ],
                  ),
              )),
          Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/pexels-stefan-stefancik-91227.jpg"),),
                  title: Text("Product4"),
                  subtitle: Text("This is a sample text"),
                 trailing: Column(
                   mainAxisSize: MainAxisSize.min,
                     children: [
                        Text("5.13"),
                     ]),
              )),
          Card(
              child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/pexels-vinicius-wiesehofer-1130626.jpg"),),
                  title: Text("Product5"),
                  subtitle: Text("hello"),
                  trailing: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("3.22"),
                      CircleAvatar(
                        minRadius: 5,
                        maxRadius: 10,
                        backgroundColor: Colors.teal,
                        child: Text("1"),
                      )
                    ],
                  ),
              )),
          Card(
              child: ListTile(
                leading: Icon(Icons.groups),
                  title: Text("Product6"),
                subtitle: Text("This is an important message"),
                trailing: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("3.00"),
                    CircleAvatar(
                      minRadius: 10,
                      maxRadius: 10,
                      backgroundColor: Colors.teal,
                      child: Text("13"),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
  
}