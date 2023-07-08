import 'package:myshop/widgets/app_drawer.dart';
import 'package:myshop/widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:myshop/providers/order.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  //const OrderScreen({Key? key}) : super(key: key);
 static const RouteName='/order';
  @override
  Widget build(BuildContext context) {
    final orderdata=Provider.of<Order>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Your Orders'),
      backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        itemBuilder: (context, i) => OrderItemW(orderdata.orders[i]) ,
        itemCount: orderdata.orders.length,
      ) ,
    );
  }
}
