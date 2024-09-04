import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodoForm extends StatefulWidget {
  final void Function(String, DateTime) onSubmit;

  const TodoForm({
    super.key,
    required this.onSubmit,
  });

  @override
  State<TodoForm> createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  TextEditingController _descricaoController = TextEditingController();
  DateTime _dataSelecionada = DateTime.now();

  void _submitForm() {
    String _descricaoTarefa = _descricaoController.text;

    if (_descricaoTarefa.isEmpty) {
      return;
    }

    widget.onSubmit(_descricaoTarefa, _dataSelecionada);
  }

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2025))
        .then((pickedDate) {
      //chamada no futuro
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _dataSelecionada = pickedDate;
      });
    });
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
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(children: <Widget>[
                Expanded(
                  child: Text(
                    _dataSelecionada == null
                        ? 'Nenhuma data selecionada'
                        : 'Data selecionada: ${DateFormat('dd/MM/y').format(_dataSelecionada)}',
                  ),
                ),
                TextButton(
                    //style: TextButton.styleFrom(primary: Colors.blue),
                    onPressed: _showDatePicker,
                    child: Text(
                      'Selecionar Data',
                    ))
              ]),
            ),
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
