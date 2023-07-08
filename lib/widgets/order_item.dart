import 'package:flutter/material.dart';
import 'package:myshop/providers/order.dart';
import 'dart:math';

class OrderItemW extends StatefulWidget {
  //const OrderItemW({Key? key}) : super(key: key);
  final OrderItems order;

  OrderItemW(this.order);

  @override
  State<OrderItemW> createState() => _OrderItemWState();
}

class _OrderItemWState extends State<OrderItemW> {
  var _isexpanded=false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(children: [
        ListTile(
          title: Text('\$${widget.order.amount}'),
          trailing:  Icon(_isexpanded ? Icons.expand_less : Icons.expand_more),
          onTap: (){
            setState(() {
              _isexpanded = !_isexpanded;
            });

          },
        ),

        if(_isexpanded)
          Container(
            height: (widget.order.products.length *20 +50),
            child: ListView.builder(itemBuilder: (prod, i) => Row(
              children: [
                Text('\$${widget.order.title}')
              ],
            ),
            itemCount: widget.order.products.length,)
            ),


      ],

      ));
  }
}
