import 'package:flutter/material.dart';
void main() {
  runApp(
     MaterialApp(
      title: 'Meu App Ola Mundo',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Meu Primeiro App"),
          backgroundColor: Colors.purple,
        ),
        body: Center(
            child: Text(
              "Olá mundo!",
              textDirection: TextDirection.ltr,
              style: TextStyle(fontSize: 30),
            ),
          ),
      ),
      ),
  );
}
