import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_5/providers/cart_providers.dart';

class CartItem extends StatelessWidget {
  // const CartItem({ Key? key }) : super(key: key);

  final String? id;
  final String? prodId;
  final String? title;
  final double? price;
  final int? quantity;

  CartItem({
    this.id,
    this.prodId,
    this.title,
    this.price,
    this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.startToEnd,
      onDismissed: (direction){
        Provider.of<CartProvider>(context, listen: false).removeCart(prodId!);
      },
      background: Stack(
        children: [
          Container(
            color: Colors.red,
          ),
          Icon(
            Icons.delete,
            color: Colors.white,
            size: 60,
          )
        ],
      ),
      key: ValueKey(id),
      child: Card(
        elevation: 3,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Row(
            children: [
              CircleAvatar(
                child: FittedBox(
                  child: Text("\$" + price.toString()),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                title!,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text(quantity.toString() + " x " + price.toString())
            ],
          ),
        ),
      ),
    );
  }
}
