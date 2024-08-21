import 'package:flutter/material.dart';

class TutorialHome extends StatelessWidget {

  /* 
  const TutorialHome({super.key}): O construtor da classe é definido como constante (const), 
  o que melhora a eficiência quando o widget é reconstruído. A chave (key) é passada 
  para o construtor da classe pai (super.key), o que é útil para identificar 
  o widget na árvore de widgets.
  */
  const TutorialHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Primeiro App', style: TextStyle(color: Colors.white),),
        backgroundColor: ThemeData().primaryColor,
      ),
      body: const Center(
        child: Text(
          'Olá mundo!',
          style: TextStyle(fontSize: 30),
        ),
      ),
      floatingActionButton: const FloatingActionButton(
        tooltip: 'Add', // tecnologias assistivas
        onPressed: null,
        child: Icon(Icons.add),
      ),
    );
  }
}
