import 'package:f05_lugares_app/data/dados.dart';
import 'package:f05_lugares_app/main.dart';
import 'package:f05_lugares_app/model/lugar.dart';
import 'package:f05_lugares_app/model/pais.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:provider/provider.dart';

class FormLugar extends StatefulWidget {
  final Lugar? lugar;

  const FormLugar({super.key, this.lugar});

  @override
  State<FormLugar> createState() => _FormLugarState();
}

class _FormLugarState extends State<FormLugar> {
  final List<Pais> _paisesDisponiveis = paises;

  String _titulo = "";
  String _imagemUrl = "";
  double _avaliacao = 0.0;
  double _custoMedio = 0.0;
  List<String> _paisesSelecionados = [];
  List<String> _recomendacoes = [];

  final _recomendacaoController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.lugar != null) {
      _titulo = widget.lugar!.titulo;
      _imagemUrl = widget.lugar!.imagemUrl;
      _avaliacao = widget.lugar!.avaliacao;
      _custoMedio = widget.lugar!.custoMedio;
      _paisesSelecionados = widget.lugar!.paises;
      _recomendacoes = widget.lugar!.recomendacoes;
      print(widget.lugar!.titulo);
      print(widget.lugar!.imagemUrl);
      print(widget.lugar!.avaliacao);
      print(widget.lugar!.custoMedio);
    }
  }

  @override
  Widget build(BuildContext context) {
    final lugarModel = Provider.of<LugarModel>(context, listen: true);

    return Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          TextFormField(
            initialValue: _titulo,
            decoration: InputDecoration(labelText: 'Título'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Título é obrigatório';
              }
              return null;
            },
            onSaved: (value) => _titulo = value!,
          ),
          const SizedBox(height: 25),
          TextFormField(
            initialValue: _imagemUrl,
            decoration: InputDecoration(labelText: 'URL da Imagem'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'URL da Imagem é obrigatório';
              }
              return null;
            },
            onSaved: (value) => _imagemUrl = value!,
          ),
          const SizedBox(height: 25),
          Text('Avaliação', style: TextStyle(fontSize: 18)),
          Slider(
            value: _avaliacao,
            min: 0,
            max: 5,
            divisions: 10,
            label: _avaliacao.toString(),
            onChanged: (value) => setState(() => _avaliacao = value),
          ),
          const SizedBox(height: 25),
          TextFormField(
            decoration: InputDecoration(labelText: 'Custo Médio'),
            initialValue: _custoMedio.toString(),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Custo Médio é obrigatório';
              } else if (double.tryParse(value) == null) {
                return 'Custo Médio deve ser um número';
              }
              return null;
            },
            onSaved: (value) => _custoMedio = double.parse(value!),
          ),
          const SizedBox(height: 25),
          ExpansionTile(
            title: Text(
              'Selecionar Países',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            children: _paisesDisponiveis.map((pais) {
              return CheckboxListTile(
                title: Text(pais.titulo),
                value: _paisesSelecionados.contains(pais.id),
                onChanged: (bool? selecionado) {
                  setState(() {
                    if (selecionado == true) {
                      _paisesSelecionados.add(pais.id);
                    } else {
                      _paisesSelecionados.remove(pais.id);
                    }
                  });
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 25),
          Text("Adicione recomendações", style: TextStyle(fontSize: 18)),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _recomendacaoController,
                  decoration: InputDecoration(hintText: 'Adicionar item'),
                ),
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  if (_recomendacaoController.text.isNotEmpty) {
                    setState(() {
                      _recomendacoes.add(
                          (_recomendacoes.length + 1).toString() +
                              '. ' +
                              _recomendacaoController.text);
                      _recomendacaoController.clear();
                    });
                  }
                },
              ),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _recomendacoes.length,
            itemBuilder: (ctx, index) {
              return ListTile(
                title: Text(_recomendacoes[index]),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      _recomendacoes.removeAt(index);
                    });
                  },
                ),
              );
            },
          ),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                final novoLugar = Lugar(
                  id: widget.lugar == null
                      ? Random().nextInt(1000).toString()
                      : widget.lugar!.id,
                  titulo: _titulo,
                  imagemUrl: _imagemUrl,
                  avaliacao: _avaliacao,
                  custoMedio: _custoMedio,
                  paises: _paisesSelecionados,
                  recomendacoes: _recomendacoes,
                );
                if (widget.lugar == null) {
                  lugarModel.addLugar(novoLugar);
                  Navigator.of(context).pushReplacementNamed('/');
                } else {
                  lugarModel.updateLugar(novoLugar);
                  Navigator.of(context).pop();
                }

                final snackBar = SnackBar(
                  content: Text(widget.lugar == null
                      ? 'Lugar adicionado com sucesso!'
                      : 'Lugar atualizado com sucesso!'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            child: Text(widget.lugar == null ? 'Adicionar' : 'Salvar'),
          ),
        ],
      ),
    );
  }
}
