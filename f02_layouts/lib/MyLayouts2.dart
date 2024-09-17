import 'package:flutter/material.dart';

class MyLayouts2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Exemplo de Layout', style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.pink,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                color: Colors.blue,
                child: Text(
                  'Container no topo (Column)',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 16.0), // Espaçamento entre containers
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      color: Colors.red,
                      child: Text(
                        'Container à esquerda (Row)',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0), // Espaçamento entre os containers na Row
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      color: Colors.green,
                      child: Text(
                        'Container à direita (Row)',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0), // Espaçamento entre containers
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  color: Colors.orange,
                  child: Text(
                    'Container na base (Column)',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 16.0), // Espaçamento entre containers
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  color: Colors.amber,
                  child: Text(
                    'Container na base (Column)',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 16.0), // Espaçamento entre containers
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      color: Colors.red,
                      child: Text(
                        'Container à esquerda (Row)',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0), // Espaçamento entre os containers na Row
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      color: Colors.green,
                      child: Text(
                        'Container à direita (Row)',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0), // Espaçamento entre os containers na Row
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      color: Colors.blue,
                      child: Text(
                        'Container à direita (Row)',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
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