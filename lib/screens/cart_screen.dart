import 'package:flutter/material.dart';
import 'package:myshop/providers/cart.dart';
import 'package:provider/provider.dart';
import 'package:myshop/widgets/cart_item.dart';
import 'package:myshop/providers/order.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const Routename='/cart';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context)

  {
    final total=Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bill'),
        backgroundColor: Theme.of(context).primaryColor,
      ),

      body: Column(
  children: [
    Card(
       margin: const EdgeInsets.all(10),
    shadowColor: Colors.grey,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
      const Text('Your total =',
      style: TextStyle(fontSize: 20,),),

      Chip(label: Text(total.totalamount.toString(),
      style: const TextStyle(color: Colors.white),),
      backgroundColor: Theme.of(context).primaryColor,
      ),

       TextButton(onPressed: (){
         Provider.of<Order>(context,listen: false).addOrder
           (total.items.values.toList(), total.totalamount
         );
                total.clearcart();
       }, child: Text('Order Now',
       style: TextStyle(color: Theme.of(context).primaryColor),))

      ],
  ),
    ),
    ),

    SizedBox(height: 10,),
    Expanded(child: ListView.builder(
      itemBuilder: (context, i) => CartItemW(id: total.items.values.toList()[i].id,
          title: total.items.values.toList()[i].title,
          price: total.items.values.toList()[i].price,
          quantity: total.items.values.toList()[i].quantity,
      productId: total.items.keys.toList()[i]),
    itemCount: total.itemCount,
    ))
    ],
  ));
  }
}
