import 'package:flutter/material.dart';

class MeuDrawer extends StatelessWidget {
  const MeuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: ThemeData().primaryColor,
            ),
            child: Text(
              'Configurações',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(Icons.category),
            title: const Text('Países'),
            onTap: () {
              //context.pushReplacement('/');
              Navigator.of(context).pushReplacementNamed(
                '/',
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.engineering),
            title: const Text('Configurações'),
            onTap: () {
              //context.pushReplacement('/configuracoes');
              Navigator.of(context).pushReplacementNamed(
                '/configuracoes',
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: const Text('Adicionar Lugar'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                '/adicionarLugar',
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.pin_drop_rounded),
            title: const Text('Gerenciar Lugares'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(
                '/gereciarLugares',
              );
            }
          ),
          ListTile(
            leading: Icon(Icons.map_outlined),
            title: const Text('Gerenciar Países'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed(
                '/gerenciarPaises',
              );
            }
          )
        ],
      ),
    );
  }
}
