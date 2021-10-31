import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_5/providers/cart_providers.dart';
import 'package:shop_app_5/providers/orders_providers.dart';
import 'package:shop_app_5/screens/orders_creens.dart';
import 'package:shop_app_5/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  static const routeName = '/home/cart_item';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Cart Item"),
        ),
        body: Column(
          children: [
            Card(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text("Total"),
                    Spacer(),
                    Chip(
                      label: Text(
                        "\$" + cart.totalAmount.toString(),
                      ),
                      backgroundColor: Colors.orange,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(OrderScreen.routeName);
                        Provider.of<OrderProviders>(context, listen: false)
                            .addOrders(
                                cart.items.values.toList(), cart.totalAmount);
                                cart.clear();
                      },
                      child: Text("Orders Now"),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return CartItem(
                    id: cart.items.values.toList()[index].id,
                    prodId: cart.items.keys.toList()[index],
                    title: cart.items.values.toList()[index].title,
                    price: cart.items.values.toList()[index].price,
                    quantity: cart.items.values.toList()[index].quantity,
                  );
                },
                itemCount: cart.items.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
