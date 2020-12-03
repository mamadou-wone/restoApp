import 'package:flutter/material.dart';

class Product {
  String name;
  int price;
  String category;
  String firstImage;
  String secondImage;
  String description;
  VoidCallback onTap;
  double rating;

  Product(
      {this.name,
      this.price,
      this.category,
      this.firstImage,
      this.secondImage,
      this.description,
      this.onTap,
      this.rating});
}
