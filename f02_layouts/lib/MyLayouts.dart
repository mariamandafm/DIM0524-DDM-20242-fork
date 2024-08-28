import 'package:flutter/material.dart';

class MyLayouts extends StatelessWidget {
  const MyLayouts({super.key});

  @override
  Widget build(BuildContext context) {

    const double boxSize = 50;
    /*1. mudar o main AxisAlgiment
    2. mudar o tamanho para ver que usa o espaço necessário
    3. aumentar o numero de caixas para dar overflow
    4. Usar expanded
    5. Aplicar outra linha
    6. Variar props na coluna
    */

    return Scaffold(
      appBar: AppBar(title: Text("Meus Layouts"),),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: boxSize),
                    color: Colors.red,
                    child: Text("1",textAlign: TextAlign.center),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: boxSize),
                    color: Colors.blue,
                    child: Text("1",textAlign: TextAlign.center),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: boxSize),
                    color: Colors.green,
                    child: Text("1", textAlign: TextAlign.center,),
                  ),
                ),
                
              ],
            ),

          ],
        ),
      ),
    );
  }
}