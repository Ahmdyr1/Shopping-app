import 'package:flutter/material.dart';
import 'screens/product_overview_screen.dart';
import 'screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:myshop/providers/products.dart';
import 'package:myshop/providers/cart.dart';
import 'screens/cart_screen.dart';
import 'package:myshop/providers/order.dart';
import 'screens/orders_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
       MultiProvider(
        providers: [
           ChangeNotifierProvider(
           create: (ctx) => Products(),),
          ChangeNotifierProvider(create: (context) => Cart() ,),
          ChangeNotifierProvider(create: (context) => Order(),)


        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primaryColor: Colors.purple,



        ),

        home: ProductOverview() ,

          routes: {
            ProductDetail.RouteName: (ctx) => ProductDetail(),
            CartScreen.Routename:(ctx) => CartScreen(),
            OrderScreen.RouteName:(ctx)=>OrderScreen(),

          },


        ),
      );
    }}