import 'package:f05_lugares_app/components/drawer.dart';
import 'package:f05_lugares_app/screens/form_lugar.dart';
import 'package:flutter/material.dart';

class AdicionarLugarScreen extends StatelessWidget {
  const AdicionarLugarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeData().primaryColor,
        title: Text(
          "Adicionar Lugar",
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: MeuDrawer(),
      body: FormLugar(),
    );
  }
}