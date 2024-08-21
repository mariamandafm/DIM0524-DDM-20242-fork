import 'package:flutter/material.dart';

class TutorialHome extends StatelessWidget {
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
