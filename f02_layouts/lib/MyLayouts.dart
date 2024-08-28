import 'package:flutter/material.dart';

class MyLayouts extends StatelessWidget {
  const MyLayouts({super.key});

  @override
  Widget build(BuildContext context) {

    const double boxSize = 50;

    return Scaffold(
      appBar: AppBar(title: Text("Meus Layouts"),),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget> [
            Container(
              padding: EdgeInsets.symmetric(vertical: boxSize, horizontal: boxSize),
              color: Colors.red,
              child: Text("1"),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: boxSize, horizontal: boxSize),
              color: Colors.blue,
              child: Text("1"),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: boxSize, horizontal: boxSize),
              color: Colors.green,
              child: Text("1"),
            ),
          ],
        ),
      ),
    );
  }
}