import 'package:flutter/material.dart';

class TodoForm extends StatefulWidget {

  final void Function(String) onSubmit;

  const TodoForm({
    super.key,
    required this.onSubmit,});

  @override
  State<TodoForm> createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {

  TextEditingController _descricaoController = TextEditingController();

    void _submitForm(){

      String _descricaoTarefa = _descricaoController.text;

      if(_descricaoTarefa.isEmpty){
        return;
      }

      widget.onSubmit(_descricaoTarefa);
    }

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    onPressed: _submitForm,
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