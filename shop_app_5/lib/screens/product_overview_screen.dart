import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_5/providers/cart_providers.dart';
import 'package:shop_app_5/providers/product_providers.dart';
import 'package:shop_app_5/screens/cart_screens.dart';
import 'package:shop_app_5/screens/orders_creens.dart';
import 'package:shop_app_5/screens/user_product_screens.dart';
import 'package:shop_app_5/widgets/badges.dart';
import 'package:shop_app_5/widgets/product_item.dart';

enum FilterFavorite { Favorites, All }

class ProductOverviewScreen extends StatelessWidget {
  const ProductOverviewScreen({Key? key}) : super(key: key);
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    final prod = Provider.of<ProductProvider>(context);
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text("Hi,"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(ProductOverviewScreen.routeName);
              },
              child: Text("Home"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(OrderScreen.routeName);
              },
              child: Text("Order"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(UserProductScreen.routeName);
              },
              child: Text("Manage Products"),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          Badges(
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
              icon: Icon(Icons.shopping_cart),
            ),
            value: cart.itemCount.toString(),
            color: Colors.purple,
          ),
          PopupMenuButton(onSelected: (FilterFavorite selected) {
            print(selected);
            if (selected == FilterFavorite.Favorites) {
              return prod.showFavorites();
            }
            if (selected == FilterFavorite.All) {
              return prod.showAll();
            }
          }, itemBuilder: (context) {
            return [
              PopupMenuItem(
                value: FilterFavorite.Favorites,
                child: Text(
                  "Show Favorites",
                ),
              ),
              PopupMenuItem(
                value: FilterFavorite.All,
                child: Text(
                  "Show All",
                ),
              ),
            ];
          })
        ],
        title: Text("Shop App"),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(15),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 3 / 2),
        itemBuilder: (context, index) {
          return ChangeNotifierProvider.value(
            value: prod.items[index],
            child: ProductItem(),
          );
        },
        itemCount: prod.items.length,
      ),
    );
  }
}
