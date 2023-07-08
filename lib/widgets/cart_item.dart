import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myshop/providers/cart.dart';

class CartItemW extends StatelessWidget {
  //const CartItemW({Key? key}) : super(key: key);

  final String id;
  final String productId;
  final String title;
   final double price;
  final double quantity;

  CartItemW({
    required this.id,
    required this.productId,
    required this.title,
    required this.price,
    required this.quantity
});
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        color: Theme.of(context).colorScheme.error,
        child: Icon(Icons.delete,
        color: Colors.white,
        size: 40,),
      ),
      onDismissed: (_){
        Provider.of<Cart>(context, listen: false).removeitem(productId);
      },
      child: Card(
        margin: EdgeInsets.all(10),
        child: ListTile(
          tileColor: Colors.black12,
          leading: CircleAvatar(child: FittedBox(child: Text('\$$price',style: TextStyle(
            color: Colors.black
          ),)),
          backgroundColor: Theme.of(context).primaryColor,),
          title: Text(title),
          subtitle: Text('Total: \$${(quantity*price)}',style: TextStyle(
            color: Colors.black
          ),),
          trailing: Text('$quantity x'),
        ),
      ),
    );
  }
}
