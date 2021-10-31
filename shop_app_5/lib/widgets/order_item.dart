import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop_app_5/models/order_model.dart';

class OrderItem extends StatefulWidget {
  // const OrderItem({ Key? key }) : super(key: key);

  final OrderModel product;

  OrderItem({required this.product});

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var isShow = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            ListTile(
              title: Text(
                "\$" + widget.product.amount.toString(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  setState(() {
                    isShow = !isShow;
                  });
                },
                icon: Icon(Icons.expand_more),
              ),
            ),
            if (isShow)
              Container(
                height: min(widget.product.products.length * 20.0 + 100, 100),
                child: ListView(
                  padding: EdgeInsets.all(20),
                  children: widget.product.products
                      .map(
                        (e) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              e.title,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            Text(e.price.toString() +
                                " x " +
                                e.quantity.toString(),style: TextStyle(color: Colors.grey, fontSize: 15,),)
                          ],
                        ),
                      )
                      .toList(),
                ),
              )
          ],
        ),
      ),
    );
  }
}
