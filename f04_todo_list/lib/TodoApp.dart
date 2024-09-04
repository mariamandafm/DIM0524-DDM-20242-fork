import 'dart:math';

import 'package:f04_todo_list/model/Tarefa.dart';
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

  TextEditingController _descricaoController = TextEditingController();

  void _addTarefa() {
    print(_descricaoController.text);

    String _tarefaDescricao = _descricaoController.text;

    Tarefa _novaTarefa = Tarefa(
      id: Random().nextInt(9999).toString(),
      descricao: _tarefaDescricao,
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
            Container(
              child: Column(
                children: [
                  Text(
                    "Descrição: ",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: _descricaoController,
                    decoration: InputDecoration(
                      hintText: "Inserir descricao",
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: _addTarefa,
                    child: Text("Adicionar", style: TextStyle(fontSize: 16)),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
            Container(
              height: 300,
              child: ListView.builder(
                  itemCount: _listaTarefas.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.all(8),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _listaTarefas.elementAt(index).descricao,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
