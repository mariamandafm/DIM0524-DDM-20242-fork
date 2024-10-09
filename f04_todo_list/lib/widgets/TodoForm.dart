import 'package:flutter/material.dart';

class TodoForm extends StatefulWidget {
  final void Function(String) onSubmit;
  const TodoForm({super.key, required this.onSubmit});

  @override
  State<TodoForm> createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  TextEditingController _controllerDescricao = TextEditingController();

  void _submit(){
    widget.onSubmit(_controllerDescricao.text);
    _controllerDescricao.clear();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            "Descrição: ",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            height: 16,
          ),
          TextField(
            controller: _controllerDescricao,
          ),
          SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: _submit,
            child: Text("Adicionar", style: TextStyle(fontSize: 16)),
          ),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
