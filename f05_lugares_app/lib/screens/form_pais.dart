import 'package:f05_lugares_app/main.dart';
import 'package:f05_lugares_app/model/pais.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormPais extends StatefulWidget {
  final Pais? pais;

  const FormPais({super.key, this.pais});

  @override
  State<FormPais> createState() => _FormPaisState();
}

class _FormPaisState extends State<FormPais> {
  String _titulo = "";
  Color _cor = Colors.blue;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.pais != null) {
      _titulo = widget.pais!.titulo;
      _cor = widget.pais!.cor;
    }
  }

  @override
  Widget build(BuildContext context) {
    final paisModel = Provider.of<PaisModel>(context);

    return Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          TextFormField(
            initialValue: _titulo,
            decoration: InputDecoration(labelText: "Título"),
            onSaved: (value) {
              _titulo = value!;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return "Título é obrigatório";
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          TextFormField(
            initialValue: _cor.value.toRadixString(16),
            decoration: InputDecoration(labelText: "Cor"),
            onSaved: (value) {
              _cor = Color(int.parse(value!, radix: 16));
            },
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                final novoPais = Pais(
                  id: "c" + (paisModel.paisesDisponiveis.length + 1).toString(),
                  titulo: _titulo, 
                  cor: _cor);
                if (widget.pais == null) {
                  paisModel.addPais(novoPais);
                  Navigator.of(context).pushReplacementNamed('/');
                } else {
                  paisModel.updatePais(novoPais);
                  Navigator.of(context).pop();
                }
                final snackBar = SnackBar(
                  content: Text("País ${widget.pais == null ? "adicionado" : "atualizado"} com sucesso!"),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                
              }
            },
            child: Text(widget.pais == null ? "Adicionar" : "Atualizar"),
          ),
        ],
      ),
    );
  }
}