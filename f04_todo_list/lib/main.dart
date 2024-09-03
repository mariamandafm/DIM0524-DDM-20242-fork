
import 'package:f04_todo_list/TodoApp.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      home: TodoApp(),
      theme: ThemeData(
        // Defina o estilo global de texto
        textTheme: TextTheme(

          bodySmall: TextStyle(fontSize: 18.0),  // Configura o tamanho da fonte para bodyText1
          bodyMedium: TextStyle(fontSize: 26.0),  // Configura o tamanho da fonte para bodyText2
          bodyLarge: TextStyle(fontSize: 30),
        ),
      ),
    )
  );
}