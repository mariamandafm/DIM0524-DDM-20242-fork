import 'package:f05_lugares_app/data/dados.dart';
import 'package:f05_lugares_app/model/lugar.dart';
import 'package:f05_lugares_app/model/pais.dart';
import 'package:f05_lugares_app/screens/abas.dart';
import 'package:f05_lugares_app/screens/adicionar_lugar.dart';
import 'package:f05_lugares_app/screens/adicionar_pais.dart';
import 'package:f05_lugares_app/screens/configuracoes.dart';
import 'package:f05_lugares_app/screens/detalhes_lugar.dart';
import 'package:f05_lugares_app/screens/gerenciar_lugares.dart';
import 'package:f05_lugares_app/screens/gerenciar_paises.dart';
import 'package:f05_lugares_app/screens/lugares_por_pais.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => LugarModel()),
        ChangeNotifierProvider(create: (ctx) => PaisModel()),
      ],
      child: MeuApp(),
    ),
  );
}

class LugarModel extends ChangeNotifier {
  final List<Lugar> _lugaresFavoritos = [];
  final List<Lugar> _lugares = List.from(lugares);

  void toggleLugarFavorito(Lugar lugar) {
    _lugaresFavoritos.contains(lugar)
        ? _lugaresFavoritos.remove(lugar)
        : _lugaresFavoritos.add(lugar);
    notifyListeners();
  }

  bool isFavorito(Lugar lugar) {
    return _lugaresFavoritos.contains(lugar);
  }

  void addLugar(Lugar lugar) {
    _lugares.add(lugar);
    notifyListeners();
  }

  void removeLugar(int index) {
    _lugares.removeAt(index);
    notifyListeners();
  }

  void updateLugar(Lugar lugar) {
    final index = _lugares.indexWhere((element) => element.id == lugar.id);
    if (index >= 0) {
      _lugares[index] = lugar;
      notifyListeners();
    }
  }
 
  List<Lugar> get lugaresFavoritos => _lugaresFavoritos;

  List<Lugar> get lugaresDisponiveis => List.from(_lugares);
}

class PaisModel extends ChangeNotifier {
  final List<Pais> _paises = List.from(paises);

  void addPais(Pais pais) {
    _paises.add(pais);
    notifyListeners();
  }

  void removePais(int index) {
    _paises.removeAt(index);
    notifyListeners();
  }

  void updatePais(Pais pais) {
    final index = _paises.indexWhere((element) => element.id == pais.id);
    if (index >= 0) {
      _paises[index] = pais;
      notifyListeners();
    }
    notifyListeners();
  }

  List<Pais> get paisesDisponiveis => List.from(_paises);
}

class MeuApp extends StatelessWidget {
  const MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (ctx) => MinhasAbas(),
        '/lugaresPorPais': (ctx) => LugarPorPaisScreen(),
        '/detalheLugar': (ctx) => DetalhesLugarScreen(),
        '/configuracoes': (ctx) => ConfigracoesScreen(),
        '/adicionarLugar': (ctx) => AdicionarLugarScreen(),
        '/adicionarPais': (ctx) => AdicionarPaisScreen(),
        '/gereciarLugares': (ctx) => GerenciarLugaresScreen(),
        '/gerenciarPaises': (ctx) => GerenciarPaisesScreen(),
      },
    );
  }
}
