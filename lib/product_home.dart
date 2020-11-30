import 'package:flutter/material.dart';
import 'package:restoapp/modals/product.dart';
import 'package:restoapp/modals/product_list.dart';

class ProductHomePage extends StatefulWidget {
  @override
  _ProductHomePageState createState() => _ProductHomePageState();
}

class _ProductHomePageState extends State<ProductHomePage> {
  List<ProductModel> productList = ProductList().productList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("bonCoin")),
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (BuildContext context, int index){
          
        }
      ),
    );
  }
}
