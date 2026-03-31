import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: context.ramTheme.primary,
        // title: RamTitleText(
        //   text: 'Travel To Gether',
        //   colorText: context.ramTheme.onPrimary,
        // ),
      ),
      body: Center(child: Text('Travel To Gether')),
    );
  }
}
