import 'package:flutter/material.dart';
import 'package:myshop/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:myshop/providers/product.dart';
import 'package:myshop/providers/cart.dart';

class ProductItem extends StatelessWidget {
  //const ProductItem({Key? key}) : super(key: key);





  @override
  Widget build(BuildContext context) {
    final products= Provider.of<Product>(context, listen: false);
    final cart=Provider.of<Cart>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(footer: GridTileBar(
          title: Text(products.title, textAlign:TextAlign.center),
          backgroundColor: Colors.black38,
          leading: Consumer<Product>(
            builder: (context, value, child) => IconButton(onPressed: (){
              products.FavoriteStatus();
            },
                icon: products.isFavorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
            color: Colors.red,),
          ),



        trailing: IconButton(
            onPressed: (){
              cart.additems(products.id, products.price, products.title);

            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ),child: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, ProductDetail.RouteName, arguments: products.id);
        },
          child: Image.network(products.imageUrl,
      fit: BoxFit.cover),
        ),
      ),
    );
  }
}
