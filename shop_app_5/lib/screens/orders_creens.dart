import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_5/providers/orders_providers.dart';
import 'package:shop_app_5/widgets/order_item.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);
  static const routeName = '/home/cart/orders';

  @override
  Widget build(BuildContext context) {
    final order = Provider.of<OrderProviders>(context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Orders"),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return OrderItem(
              product: order.items[index],
            );
          },
          itemCount: order.items.length,
        ),
      ),
    );
  }
}
