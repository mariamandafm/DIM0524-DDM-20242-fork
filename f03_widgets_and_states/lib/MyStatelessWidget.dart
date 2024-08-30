import 'package:flutter/material.dart';

class MyStatelessWidget extends StatelessWidget {
  final String text;

  MyStatelessWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateless Widget Example'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(text, style: TextStyle(fontSize: 20),),
      ),
    );
  }
}