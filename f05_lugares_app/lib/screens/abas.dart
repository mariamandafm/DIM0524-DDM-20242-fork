import 'package:f05_lugares_app/screens/favoritos.dart';
import 'package:f05_lugares_app/screens/pais_screen.dart';
import 'package:flutter/material.dart';

class MinhasAbas extends StatelessWidget {
  const MinhasAbas({super.key});

  @override
  Widget build(BuildContext context) {
    return MinhasAbasBottom();
  }
}

class MinhasAbasTop extends StatelessWidget {
  const MinhasAbasTop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: ThemeData().primaryColor,
            bottom: const TabBar(
                indicatorColor: Colors.amber,
                labelColor: Colors.amber,
                unselectedLabelColor: Colors.white60,
                tabs: [
                  Tab(
                    icon: Icon(
                      Icons.category,
                    ),
                    text: "Países",
                  ),
                  Tab(
                    icon: Icon(
                      Icons.star,
                    ),
                    text: "Favoritos",
                  )
                ]),
          ),
          body: const TabBarView(
            children: [
              PaisScreen(),
              FavoritosScreen(),
            ],
          ),
        ));
  }
}

class MinhasAbasBottom extends StatelessWidget {
  const MinhasAbasBottom({super.key});

  @override
  Widget build(BuildContext context) {

    final List<String> _titulos = [
    'Paises',
    'Meus Favoritos',
  ];
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            body: Column(
              children: <Widget>[
                Expanded(
                  child: TabBarView(
                    children: [
                      PaisScreen(),
                      FavoritosScreen(),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 30),
                  decoration: BoxDecoration(
                    color: ThemeData().primaryColor,
                  ),
                  child: const TabBar(
                      indicatorColor: Colors.amber,
                      labelColor: Colors.amber,
                      unselectedLabelColor: Colors.white60,
                      tabs: [

                        Tab(
                          icon: Icon(
                            Icons.category,
                          ),
                          text: "Países",
                        ),
                        Tab(
                          icon: Icon(
                            Icons.star,
                          ),
                          text: "Favoritos",
                        )
                      ]),
                )
              ],
            )));
  }
}