import 'package:flutter/material.dart';

class MyStatefulWdget extends StatefulWidget {
  const MyStatefulWdget({super.key});

  @override
  State<MyStatefulWdget> createState() => _MyStatefulWdgetState();
}

class _MyStatefulWdgetState extends State<MyStatefulWdget> {
  int _contador = 0;

  void _contar() {
    setState(() {
      _contador++;
    });

    print(_contador);
  }

  void _zerar() {
    setState(() {
      _contador = 0;
    });
  }

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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "O valor do contador é: ",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "$_contador",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: _contar,
                  child: Text(
                    "Contar",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                TextButton(
                  onPressed: _zerar,
                  child: Text(
                    "Zerar",
                    style: TextStyle(fontSize: 20),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
