import 'package:flutter/material.dart';

class ListView_List extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("List view custom")
      ),
      body: ListView.custom(
          // childrenDelegate: SliverChildListDelegate([
          //   Card(
          //     child: Icon(Icons.account_circle),
          //   ),
          //   Card(
          //     child: Icon(Icons.account_circle),
          //   ),
          //   Card(
          //     child: Icon(Icons.account_circle),
          //   )
          //   ,Card(
          //     child: Icon(Icons.account_circle),
          //   )
          //   ,Card(
          //     child: Icon(Icons.account_circle),
          //   )
          // ])

        childrenDelegate: SliverChildBuilderDelegate((context, index) =>
            Card(
              child:Icon(Icons.manage_accounts),
            ),
          childCount: 10
        ),
      ),
    );
  }

}