import 'package:f04_todo_list/model/Tarefa.dart';
import 'package:f04_todo_list/screens/TaskDetail.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
    required List<Tarefa> listaTarefas,
  }) : _listaTarefas = listaTarefas;

  final List<Tarefa> _listaTarefas;

  @override
  Widget build(BuildContext context) {
    _openTaskDetail() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => TaskDetail(),
        ),
      );
    }

    return Container(
      height: 300,
      child: ListView.builder(
          itemCount: _listaTarefas.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: _openTaskDetail,
              child: Card(
                margin: EdgeInsets.all(8),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "${DateFormat('dd/MM/y').format(_listaTarefas.elementAt(index).dataTarefa)}",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Expanded(
                        child: Text(
                          _listaTarefas.elementAt(index).descricao,
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
