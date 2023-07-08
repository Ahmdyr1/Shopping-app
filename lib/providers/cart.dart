import 'package:flutter/foundation.dart';

class CartItem
{
  final String id;

  final String title;
  final double quantity;
  final double price;

  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity
});
}

class Cart with ChangeNotifier{


   Map<String, CartItem> _items ={};

  Map<String, CartItem> get items{
    return {..._items};
  }
  int get itemCount{
    return _items.length;
  }
  double get totalamount{
    var total=0.0;
    _items.forEach((key, cartitem) {
      total += cartitem.price *cartitem.quantity;

    });
    return total;
  }

  void additems(String productId, double price, String title )
  {
    if (_items.containsKey(productId))
      {
        _items.update(productId, (existing) =>
            CartItem(id: existing.id,
                title: existing.title,
                price: existing.price,
                quantity: existing.quantity+1));
      }

    else {
      (_items.putIfAbsent(productId,
            () => CartItem(id: DateTime.now().toString(),
                title: title,
                price: price,
                quantity: 1)));
    }


    }
   void removeitem(String productId)
   {
      _items.remove(productId);
     notifyListeners();
   }

   void clearcart ()
   {
      _items={};
      notifyListeners();

   }
    notifyListeners();



  }
