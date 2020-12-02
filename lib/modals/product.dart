import 'package:flutter/material.dart';

class ProductModel extends StatelessWidget {
  String name;
  int price;
  String category;
  String firstImage;
  String secondImage;
  String description;
  VoidCallback onTap;
  double rating;

  ProductModel(
      {this.name,
      this.price,
      this.category,
      this.firstImage,
      this.secondImage,
      this.description,
      this.onTap,
      this.rating});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Image.network(
                    this.firstImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
