import 'package:flutter/material.dart';
import 'package:f04_todo_list/model/Tarefa.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
    required List<Tarefa> listaTarefas,
  }) : _listaTarefas = listaTarefas;

  final List<Tarefa> _listaTarefas;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemCount: _listaTarefas.length,
        itemBuilder: (context, index){
          return Card(
            margin: EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(_listaTarefas.elementAt(index).descricao,style: Theme.of(context).textTheme.bodyLarge,),
                ],
              ),
            ),
          );
        }
        ),
    );
  }
}
