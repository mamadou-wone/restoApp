import 'package:restoapp/modals/product.dart';

class ProductList {
  List<ProductModel> productList = [
    ProductModel(
      name: "Steak",
      price: 3500,
      category: "Fast-Food",
      description: "Manger de la bonne viande",
      firstImage: "assets/food6.jpeg",
      secondImage: "assets/food6.jpeg",
      rating: 4.0,
    ),
    ProductModel(
      name: "Hamberger Royal",
      price: 2500,
      category: "Fast-Food",
      description: "Manger devient un plaisir",
      firstImage: "assets/food3.jpeg",
      secondImage: "assets/food5.jpeg",
      rating: 4.0,
    ),
  ];
}
