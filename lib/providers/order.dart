import 'package:flutter/material.dart';
import 'cart.dart';

class OrderItems {

  final String id;
  final DateTime title;
  final List<CartItem> products;
  final double amount;

  OrderItems({
    required this.id,
    required this.title,
    required this.products,
    required this.amount
});
}
 class Order with ChangeNotifier{

  final List<OrderItems> _orders=[];

  List<OrderItems> get  orders{
    return _orders;
  }
  void addOrder (List<CartItem> cartproducts, double total)
  {
    _orders.insert(0, OrderItems(id: DateTime.now().toString(),
        title: DateTime.now(),
        products: cartproducts,
        amount: total));
    notifyListeners();
  }


 }