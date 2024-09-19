

import 'package:f06_carrinho_provider/contador_provider/meu_contador.dart';
import 'package:f06_carrinho_provider/theme/theme.dart';
import 'package:f06_carrinho_provider/view/carrinho_screen.dart';
import 'package:f06_carrinho_provider/view/catalogo_screen.dart';
import 'package:f06_carrinho_provider/view/login_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Provider Demo',
        theme: appTheme,
        home: MeuContador(),
      );
  }
}
