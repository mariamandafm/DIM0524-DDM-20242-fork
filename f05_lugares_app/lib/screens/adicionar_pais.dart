import 'package:f05_lugares_app/components/drawer.dart';
import 'package:f05_lugares_app/screens/form_pais.dart';
import 'package:flutter/material.dart';

class AdicionarPaisScreen extends StatelessWidget {
  const AdicionarPaisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeData().primaryColor,
        title: Text(
          "Adicionar Pais",
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: MeuDrawer(),
      body: FormPais(),
    );
  }
}