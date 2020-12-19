import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

List restaurants = [
  // {
  //   "img": "assets/food1.jpeg",
  //   "title": "Happy Jones",
  //   "address": "1278 Loving Acres RoadKansas City, MO 64110",
  //   "rating": "4.5"
  // },
  // {
  //   "img": "assets/food2.jpeg",
  //   "title": "Uncle Boons",
  //   "address": "1278 Loving Acres RoadKansas City, MO 64110",
  //   "rating": "4.5"
  // },
  // {
  //   "img": "assets/food3.jpeg",
  //   "title": "Happy Jones",
  //   "address": "1278 Loving Acres RoadKansas City, MO 64110",
  //   "rating": "4.5"
  // },
  // {
  //   "img": "assets/food4.jpeg",
  //   "title": "Uncle Boons",
  //   "address": "1278 Loving Acres RoadKansas City, MO 64110",
  //   "rating": "4.5"
  // },
  // {
  //   "img": "assets/food5.jpeg",
  //   "title": "Happy Jones",
  //   "address": "1278 Loving Acres RoadKansas City, MO 64110",
  //   "rating": "4.5"
  // },
  // {
  //   "img": "assets/food6.jpeg",
  //   "title": "Happy Jones",
  //   "address": "1278 Loving Acres RoadKansas City, MO 64110",
  //   "rating": "4.5"
  // },
  // {
  //   "img": "assets/food7.jpeg",
  //   "title": "Happy Jones",
  //   "address": "1278 Loving Acres RoadKansas City, MO 64110",
  //   "rating": "4.5"
  // },
  // {
  //   "img": "assets/food8.jpeg",
  //   "title": "Happy Jones",
  //   "address": "1278 Loving Acres RoadKansas City, MO 64110",
  //   "rating": "4.5"
  // },
  // {
  //   "img": "assets/food9.jpeg",
  //   "title": "Happy Jones",
  //   "address": "1278 Loving Acres RoadKansas City, MO 64110",
  //   "rating": "4.5"
  // }
];

addProduct() {
  final firestoreInstance = FirebaseFirestore.instance;
  firestoreInstance.collection("resto").get().then((querySnapshot) {
    querySnapshot.docs.forEach((element) {
      restaurants.add({
        "img": element['firstImage'],
        "title": element['name'],
        "address": element['description'],
        "rating": "4.5"
      });
    });
  });
}
