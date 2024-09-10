import 'package:f05_lugares_app/components/item_pais.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
            child: Text('Configurações',style: TextStyle(fontSize: 20, color: Colors.white),),
          ),
          ListTile(
            leading: Icon(Icons.category),
            title: const Text('Países'),
            onTap: () {
              context.pushReplacement('/');
            },
          ),
          ListTile(
            leading: Icon(Icons.engineering),
            title: const Text('Configurações'),
            onTap: () {
              context.pushReplacement('/configuracoes');
            },
          ),
        ],
      ),
    );
  }
}
