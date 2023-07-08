import 'package:flutter/material.dart';
import 'package:myshop/widgets/product_item.dart';
import 'package:provider/provider.dart';
import 'package:myshop/providers/products.dart';

class ProductGrid extends StatelessWidget {
  //const ProductGrid({Key? key}) : super(key: key);
  var showFavs;
  ProductGrid(this.showFavs);
  @override
  Widget build(BuildContext context) {
    final productdata= Provider.of<Products>(context);
    final products=showFavs ? productdata.Favitems : productdata.items ;
    return GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3/2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10
        ),
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: products[i],

            child: ProductItem()),
        itemCount: products.length
    );
  }
}
