import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:restoapp/modals/product_list.dart';

class ProductController extends GetxController {
  var products = List<Product>().obs;

  var test = List<Product>().obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));
    test.value = Product(name: "Test") as List<Product>;
    FirebaseFirestore.instance.collection('resto').get().then(
      (querySnapshot) {
        querySnapshot.docs.forEach(
          (result) {
            products.add(
              Product(
                  name: result['name'],
                  price: result['price'],
                  category: result['category'],
                  firstImage: result['firstImage'],
                  secondImage: result['secondImage'],
                  description: result['description']),
            );
          },
        );
      },
    );
  }
}
