import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minha tela de login"),
        backgroundColor: ThemeData().primaryColor,
      ),
      body: Center(
        child: Text("Tela de Login"),
      )
    );
  }
}