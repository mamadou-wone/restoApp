import 'package:flutter/material.dart';

class ProductModel extends StatelessWidget {
  String name;
  int price;
  String category;
  String firstImage;
  String secondImage;
  String description;
  double rating;

  ProductModel({
    this.name,
    this.price,
    this.category,
    this.firstImage,
    this.secondImage,
    this.description,
    this.rating
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
