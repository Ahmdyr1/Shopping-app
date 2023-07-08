import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:myshop/providers/products.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key}) : super(key: key);

   static const RouteName='/product';
  @override
  Widget build(BuildContext context) {
    final productId=ModalRoute.of(context)?.settings.arguments as String;
    final products=Provider.of<Products>(context).items.firstWhere((prod) => prod.id==productId);

    return 
       Scaffold(
        appBar: AppBar(
          title: Text(products.title),
            backgroundColor: Theme.of(context).primaryColor,
        ),
            body: SingleChildScrollView(
              child: Column(

                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      child: Image.network(products.imageUrl,
                      fit: BoxFit.cover,),
                    ),
                  ),
                  
                  Text(products.title, style: const TextStyle(fontSize: 20),),
                  const SizedBox(height: 10),
                Text('\$${products.price}', style: const TextStyle(fontSize: 15),),
                  const SizedBox(height: 10),
                  Text(products.description,
                    style: const TextStyle(fontSize: 20),)
                ],
              ),
            ) ,
      
    );
  }
}
