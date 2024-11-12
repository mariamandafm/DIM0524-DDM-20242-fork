import 'package:f06_carrinho_provider/contador_provider/contador_model.dart';
import 'package:f06_carrinho_provider/contador_provider/meu_contador.dart';
import 'package:f06_carrinho_provider/model/CartModel.dart';
import 'package:f06_carrinho_provider/theme/theme.dart';
import 'package:f06_carrinho_provider/view/carrinho_screen.dart';
import 'package:f06_carrinho_provider/view/catalogo_screen.dart';
import 'package:f06_carrinho_provider/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MeuApp()
    )
  );
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Demo',
      theme: appTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
          '/catalog': (context) => CatalagoScreen(),
          '/cart': (context) => const CarrinhoScreen(),

      },
    );
  }
}
