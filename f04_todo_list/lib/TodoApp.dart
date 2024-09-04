import 'dart:math';

import 'package:f04_todo_list/model/Tarefa.dart';
import 'package:f04_todo_list/widgets/TodoForm.dart';
import 'package:f04_todo_list/widgets/TodoList.dart';
import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  List<Tarefa> _listaTarefas = [
    Tarefa(
        id: Random().nextInt(9999).toString(),
        descricao: "Estudar",
        dataTarefa: DateTime.now()),
    Tarefa(
        id: Random().nextInt(9999).toString(),
        descricao: "Jogar",
        dataTarefa: DateTime.now())
  ];

  

  void _addTarefa(String descricaoTarefa) {
    

    Tarefa _novaTarefa = Tarefa(
      id: Random().nextInt(9999).toString(),
      descricao: descricaoTarefa,
      dataTarefa: DateTime.now(),
    );

    setState(() {
      _listaTarefas.add(_novaTarefa);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Minhas Tarefas",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: ThemeData().primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TodoForm(onSubmit: _addTarefa),
            TodoList(listaTarefas: _listaTarefas)
          ],
        ),
      ),
    );
  }
}


