import 'package:flutter/material.dart';
import 'package:myshop/screens/cart_screen.dart';
import 'package:myshop/widgets/app_drawer.dart';
import 'package:myshop/widgets/product_grid.dart';

enum Filter{
Favorites,
Allitems;

}

class ProductOverview extends StatefulWidget {
   ProductOverview({Key? key}) : super(key: key);

  @override
  State<ProductOverview> createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  var _showOnlyFav=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyShop"),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [

          PopupMenuButton(onSelected:  (Filter selected) => {

            setState((){
              if(selected==Filter.Favorites){
                _showOnlyFav=true;
              }
              else{
                _showOnlyFav=false;
              }


            })



    },
              itemBuilder: (context) =>
              [const PopupMenuItem(value: Filter.Favorites,child: Text('Favorites'),
              ),
                const PopupMenuItem(value: Filter.Allitems,child: Text('All items'),)

              ]
          ),

          IconButton(onPressed: () {
            Navigator.of(context).pushNamed(CartScreen.Routename);
          }, icon: Icon(
            Icons.shopping_cart,
          ))



        ],
      ),
      drawer: AppDrawer(),
      body: ProductGrid(_showOnlyFav)
    );
  }
}
