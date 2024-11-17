import 'package:f05_lugares_app/components/drawer.dart';
import 'package:f05_lugares_app/main.dart';
import 'package:f05_lugares_app/model/pais.dart';
import 'package:f05_lugares_app/screens/form_pais.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GerenciarPaisesScreen extends StatelessWidget {
  const GerenciarPaisesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final paisModel = Provider.of<PaisModel>(context, listen: true);

    Future<void> _modalConfirmacaoBuilder(BuildContext context, int index) async {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Confirmação"),
              content: Text("Deseja realmente excluir este país?"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Não")),
                TextButton(
                    onPressed: () {
                      paisModel.removePais(index);
                      Navigator.of(context).pop();
                      const snackBar = SnackBar(
                        content: Text('País removido com sucesso!'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: Text("Sim"))
              ],
            );
          });
    }

    void _modalEdicao(BuildContext context, Pais pais) {
      showModalBottomSheet(
        context: context, 
        isScrollControlled: true,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: FormPais(pais: pais));
        }
   
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Gerenciar Países",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: ThemeData().primaryColor,
        // Botão de adicionar
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/adicionarPais'); 
            },
          )
        ],
      ),
      drawer: MeuDrawer(),
      body: Consumer<PaisModel>(builder: (context, pais, child) {
          if (pais.paisesDisponiveis.isEmpty) {
            return const Center(
              child: Text(
                'Nenhum Pais Cadastrado!',
                style: TextStyle(fontSize: 20),
              ),
            );
          } else {
            return ListView.builder(
                itemCount: pais.paisesDisponiveis.length,
                itemBuilder: (ctx, index) {
                  return ListTile(
                    title:
                        Text(pais.paisesDisponiveis.elementAt(index).titulo),
                    trailing: Wrap(
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                           _modalEdicao(context, pais.paisesDisponiveis.elementAt(index));
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _modalConfirmacaoBuilder(context, index);
                          },
                        )
                      ],
                    ),
                  );
                });
          }
        }));
  }
}