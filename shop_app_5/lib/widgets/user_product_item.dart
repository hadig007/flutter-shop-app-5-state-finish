import 'package:flutter/material.dart';
import 'package:shop_app_5/models/product_model.dart';
import 'package:shop_app_5/widgets/add_product_screens.dart';

class UserProductItem extends StatelessWidget {
  // const UserProductItem({ Key? key }) : super(key: key);

  final ProductModel data;

  UserProductItem(this.data);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(data.imageUrl),
            ),
            SizedBox(width: 20,),
            Text(
              data.title,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AddProductScreen.routeName, arguments: data.id);
              },
              icon: Icon(
                Icons.edit,
                color: Colors.lightBlue,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
