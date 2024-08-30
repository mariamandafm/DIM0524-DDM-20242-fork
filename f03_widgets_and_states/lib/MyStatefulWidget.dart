import 'package:flutter/material.dart';

class MyStatefulWdget extends StatefulWidget {
  const MyStatefulWdget({super.key});

  @override
  State<MyStatefulWdget> createState() => _MyStatefulWdgetState();
}

class _MyStatefulWdgetState extends State<MyStatefulWdget> {

  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu Widget Stateful"),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Text("O valor do contador é: $contador"),
              SizedBox(height: 16,),
              ElevatedButton(onPressed: (){}, child: Text("Contar"),),
            ],
          ),
        ),
      )
    );
  }
}