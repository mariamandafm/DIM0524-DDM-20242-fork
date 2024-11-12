import 'package:f06_carrinho_provider/model/CartModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarrinhoScreen extends StatelessWidget {
  const CarrinhoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart', style: Theme.of(context).textTheme.headlineLarge),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.yellow,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: _CartList(),
              ),
            ),
            const Divider(height: 4, color: Colors.black),
            _CartTotal()
          ],
        ),
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var itemNameStyle = Theme.of(context).textTheme.headlineSmall;


    return Consumer<CartModel>(
      builder: (context, cartModel, child) {
        return ListView.builder(
          itemCount: cartModel.cartItems.length,
          itemBuilder: (context, index) => ListTile(
            leading: const Icon(Icons.done),
            trailing: IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              onPressed: () {
                cartModel.removeItem(cartModel.cartItems[index]);
              },
            ),
            title: Text(
              cartModel.cartItems[index].nome,
              style: itemNameStyle,
            ),
          ),
      );
      } 
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var hugeStyle =
        Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 48);

    return SizedBox(
      height: 200,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                    Text('\$${0}', style: hugeStyle),
            const SizedBox(width: 24),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Função de compra não é suportada ainda.')));
              },
              style: TextButton.styleFrom(backgroundColor: Colors.white),
              child: const Text('COMPRAR'),
            ),
          ],
        ),
      ),
    );
  }
}