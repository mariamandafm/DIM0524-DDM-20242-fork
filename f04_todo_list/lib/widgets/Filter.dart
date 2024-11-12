import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Filter extends StatefulWidget {
  final Function(String, {DateTime? dataSelecionada, DateTime? dataCriacao}) onFilter;

  const Filter({super.key, required this.onFilter});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {

  DateTime? _dataExecucao;
  String _prioridadeFiltro = 'TODOS';
  DateTime? _dataCriacao;

  @override
  Widget build(BuildContext context) {
    final DateTime? dataExecucao = _dataExecucao;
    final DateTime? dataCriacao = _dataCriacao;

    void _showDatePickerExecucao() {
      showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2025))
          .then((pickedDate) {
        if (pickedDate == null) {
          return;
        }
        setState(() {
          _dataExecucao = pickedDate;
        });
      });
    }

    void _showDatePickerCriacao() {
      showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime(2025))
          .then((pickedDate) {
        if (pickedDate == null) {
          return;
        }
        setState(() {
          _dataCriacao = pickedDate;
        });
      });
    }
  
    return Column(
            children: [
              Text("Prioridade", style: TextStyle(fontSize: 20),),
              DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    hintText: "Prioridade",
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  value: _prioridadeFiltro,
                  items: <String>['TODOS', 'ALTA', 'NORMAL', 'BAIXA']
                      .map((String value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          ))
                      .toList(),
                  onChanged: (String? value) {
                    _prioridadeFiltro = value!;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                Text("Data execução", style: TextStyle(fontSize: 20),),
                Row(
                  children: [
                     Expanded(
                       child: Text(
                           _dataExecucao == null
                           ? 'Selecione uma data'
                           : DateFormat('dd/MM/y').format(dataExecucao!),   
                           style: TextStyle(fontSize: 16),        
                        ),
                     ),
                  ElevatedButton(
                  onPressed: _showDatePickerExecucao,
                  child: Icon(Icons.calendar_today),
                ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Text("Data criação", style: TextStyle(fontSize: 20),),
                Row(
                  children: [
                     Expanded(
                       child: Text(
                           _dataCriacao == null
                           ? 'Selecione uma data'
                           : DateFormat('dd/MM/y').format(dataCriacao!),  
                           style: TextStyle(fontSize: 16)         
                        ),
                     ),
                  ElevatedButton(
                  onPressed: _showDatePickerCriacao,
                  child: Icon(Icons.calendar_today),
                ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
            ElevatedButton(
              onPressed: () {
                if (dataExecucao == null) {
                  widget.onFilter(_prioridadeFiltro);
                } else {
                  widget.onFilter(_prioridadeFiltro, dataSelecionada: dataExecucao);
                }
                Navigator.of(context).pop();
              },
              child: Text("Filtrar", style: TextStyle(fontSize: 16)),
          ),
            ],
        );
  }
}