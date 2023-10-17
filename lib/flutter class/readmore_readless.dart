import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

void main(){
  runApp(MaterialApp(home: Read_moreEx(),));
}
class Read_moreEx extends StatelessWidget {
  const Read_moreEx({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
        ReadMoreText(
        'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
        trimLines: 2,
        colorClickableText: Colors.pink,
        trimMode: TrimMode.Line,
        trimCollapsedText: 'Show more',
        trimExpandedText: 'Show less',
        moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
      ReadMoreText(
        'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
        trimLines: 2,
        colorClickableText: Colors.purple,
        trimMode: TrimMode.Line,
        trimCollapsedText: 'read more',
        trimExpandedText: 'read less',
        moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      )
        ],
      ),
    );
  }
}
