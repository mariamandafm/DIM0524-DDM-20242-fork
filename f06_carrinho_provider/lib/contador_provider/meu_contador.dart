import 'package:flutter/material.dart';

class MeuContador extends StatelessWidget {
  const MeuContador({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Meu Contador Provider", style: TextStyle(color: Colors.white),),
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
                  "${0}",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: (){},
                  child: Text(
                    "Contar",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                TextButton(
                  onPressed: (){},
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