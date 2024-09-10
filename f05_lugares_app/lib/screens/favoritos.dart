import 'package:flutter/material.dart';

class FavoritosScreen extends StatelessWidget {
  const FavoritosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeData().primaryColor,
        title: Text(
          "Favoritos",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Text("Tela de favoritos", style: TextStyle(fontSize: 20),),
      ),
    );
  }
}