import 'package:flutter/material.dart';
import 'package:myshop/screens/orders_screen.dart';




class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: Column(
        children: [
          AppBar(title: const Text('Select'),
            backgroundColor: Theme.of(context).primaryColor,
            automaticallyImplyLeading: false,),
          const Divider(),
          ListTile(
            tileColor: Colors.black12,

            iconColor: Theme.of(context).primaryColor,
            leading: const Icon(Icons.shop),
            title: const Text('Shop'),
            onTap: (){
              Navigator.of(context).pushReplacementNamed('/');
            } ,
          ),
          const Divider(),
           ListTile(
             tileColor: Colors.black12,
            iconColor: Theme.of(context).primaryColor,
            leading: const Icon(Icons.payment),
            title: const Text('Order'),
             onTap: () {
              Navigator.of(context).pushReplacementNamed(OrderScreen.RouteName);
            },
          )

        ],
      ),
    );
  }
}
