import 'package:f05_lugares_app/components/drawer.dart';
import 'package:f05_lugares_app/main.dart';
import 'package:f05_lugares_app/model/lugar.dart';
import 'package:f05_lugares_app/screens/form_lugar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GerenciarLugaresScreen extends StatelessWidget {
  const GerenciarLugaresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lugarModel = Provider.of<LugarModel>(context, listen: true);

    Future<void> _modalConfirmacaoBuilder(BuildContext context, int index) async {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Confirmação"),
              content: Text("Deseja realmente excluir este lugar?"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Não")),
                TextButton(
                    onPressed: () {
                      lugarModel.removeLugar(index);
                      Navigator.of(context).pop();
                      const snackBar = SnackBar(
                        content: Text('Lugar removido com sucesso!'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: Text("Sim"))
              ],
            );
          });
    }

    void _modalEdicao(BuildContext context, Lugar lugar) {
      showModalBottomSheet(
        context: context, 
        isScrollControlled: true,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: FormLugar(lugar: lugar));
        }
        
      );
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Gerenciar Lugares",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: ThemeData().primaryColor,
        ),
        drawer: MeuDrawer(),
        body: Consumer<LugarModel>(builder: (context, lugar, child) {
          if (lugar.lugaresDisponiveis.isEmpty) {
            return const Center(
              child: Text(
                'Nenhum Lugar Cadastrado!',
                style: TextStyle(fontSize: 20),
              ),
            );
          } else {
            return ListView.builder(
                itemCount: lugar.lugaresDisponiveis.length,
                itemBuilder: (ctx, index) {
                  return ListTile(
                    title:
                        Text(lugar.lugaresDisponiveis.elementAt(index).titulo),
                    trailing: Wrap(
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            _modalEdicao(context, lugar.lugaresDisponiveis.elementAt(index));
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
