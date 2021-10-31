import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_5/providers/cart_providers.dart';
import 'package:shop_app_5/providers/orders_providers.dart';
import 'package:shop_app_5/providers/product_providers.dart';
import 'package:shop_app_5/screens/cart_screens.dart';
import 'package:shop_app_5/screens/orders_creens.dart';
import 'package:shop_app_5/screens/product_detail_screen.dart';
import 'package:shop_app_5/screens/product_overview_screen.dart';
import 'package:shop_app_5/screens/user_product_screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderProviders(),
        ),
      ],
      child: MaterialApp(
        home: ProductOverviewScreen(),
        routes: {
          ProductOverviewScreen.routeName : (_)=>ProductOverviewScreen(),
          CartScreen.routeName : (_)=>CartScreen(),
          OrderScreen.routeName : (_)=>OrderScreen(),
          ProductDetailScreen.routeName : (_)=>ProductDetailScreen(),
          UserProductScreen.routeName : (_)=>UserProductScreen(),
        },
      ),
    );
  }
}
