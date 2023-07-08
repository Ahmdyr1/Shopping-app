import 'package:flutter/cupertino.dart';




class Product with ChangeNotifier  {

  final String id;
  final String title;
  final String description;
  final double price;
  bool isFavorite;
  final String imageUrl;

  Product({
    required this.title,
    required this.id,
    required this.price,
    required this.description,
    this.isFavorite = false,
    required this.imageUrl,


  });
  void FavoriteStatus()
  {
    isFavorite = !isFavorite;
    notifyListeners();



  }
}
