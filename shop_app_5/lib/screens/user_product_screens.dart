import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_5/providers/product_providers.dart';
import 'package:shop_app_5/widgets/add_product_screens.dart';
import 'package:shop_app_5/widgets/user_product_item.dart';

class UserProductScreen extends StatelessWidget {
  const UserProductScreen({Key? key}) : super(key: key);

  static const routeName = 'home/user_product';

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ProductProvider>(context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: (){
              Navigator.of(context).pushNamed(AddProductScreen.routeName);
            }, icon: Icon(Icons.add))
          ],
          title: Text("User Product"),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return UserProductItem(
              data.items[index],
            );
          },
          itemCount: data.items.length,
        ),
      ),
    );
  }
}
