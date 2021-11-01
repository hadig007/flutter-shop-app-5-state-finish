import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_5/models/product_model.dart';
import 'package:shop_app_5/providers/cart_providers.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prod = Provider.of<ProductModel>(context, listen: true);
    final cart = Provider.of<CartProvider>(context);
    return GridTile(
      footer: GridTileBar(
        backgroundColor: Colors.black45,
        title: Text(prod.title),
        leading: IconButton(
          onPressed: () {
            prod.toggleFavorite();
          },
          icon: Icon(
            prod.isFavorite ? Icons.favorite : Icons.favorite_border,
          ),
        ),
        trailing: IconButton(
          onPressed: () {
            cart.addToCart(prod.id, prod.price, prod.title);
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text("berhasil"),
                duration: Duration(seconds: 2),
                action: SnackBarAction(
                  textColor: Colors.red,
                  label: "UNDO",
                  onPressed: () {},
                ),
              ),
            );
          },
          icon: Icon(
            Icons.shopping_cart,
          ),
        ),
      ),
      child: Image.network(
        prod.imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}
