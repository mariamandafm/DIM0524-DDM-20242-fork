import 'package:f05_lugares_app/components/item_lugar.dart';
import 'package:f05_lugares_app/data/dados.dart';
import 'package:f05_lugares_app/main.dart';
import 'package:f05_lugares_app/model/lugar.dart';
import 'package:f05_lugares_app/model/pais.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LugarPorPaisScreen extends StatelessWidget {
  
  LugarPorPaisScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final pais = ModalRoute.of(context)?.settings.arguments as Pais;

    final lugarModel = Provider.of<LugarModel>(context, listen: true);
    
    //prepara a lista de lugares por pais
    final List<Lugar> lugaresPorPais = lugarModel.lugaresDisponiveis.where((lugar) {
      return lugar.paises.contains(pais.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
         backgroundColor: pais.cor,
        title: Text(
          "Lugares em ${pais.titulo}",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Consumer<LugarModel>(
        builder: (context, lugar, child){
          return ListView.builder(
            itemCount: lugaresPorPais.length,
            itemBuilder: (context, index) {
              return ItemLugar(lugar: lugaresPorPais.elementAt(index));
            },
          );
        },
      )
    );
  }
}
