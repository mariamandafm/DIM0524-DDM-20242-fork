import 'package:f05_lugares_app/model/lugar.dart';
import 'package:f05_lugares_app/model/pais.dart';
import 'package:f05_lugares_app/screens/abas.dart';
import 'package:f05_lugares_app/screens/configuracoes.dart';
import 'package:f05_lugares_app/screens/detalhes_lugar.dart';
import 'package:f05_lugares_app/screens/lugares_por_pais.dart';
import 'package:f05_lugares_app/screens/pais_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter myRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return MinhasAbas();
      },
    ),
    GoRoute(
      path: '/lugaresPorPais',
      builder: (BuildContext context, GoRouterState state) {
        Pais pais = state.extra as Pais;
        return LugarPorPaisScreen(
          pais: pais,
        );
      },
      routes: <RouteBase>[],
    ),
    GoRoute(
      path: '/detalheLugar',
      builder: (BuildContext context, GoRouterState state) {
        Lugar lugar = state.extra as Lugar;
        return DetalhesLugarScreen(
          lugar: lugar,
        );
      },
    ),
    GoRoute(
      path: '/configuracoes',
      builder: (BuildContext context, GoRouterState state) {
        return ConfigracoesScreen(
          
        );
      },
      routes: <RouteBase>[
       
      ],
    ),
  ],
);
