import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restoapp/pages/trending.dart';
import 'package:restoapp/util/categorie.dart';
import 'package:restoapp/util/categorie_item.dart';
import 'package:restoapp/util/restaurants.dart';
import 'package:restoapp/util/search_card.dart';
import 'package:restoapp/util/slide_item.dart';
import 'package:restoapp/util/trending_item.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    super.initState();
  }

  List<dynamic> resto = [];

  Widget build(BuildContext context) {
    addProduct();
    return Scaffold(
      // appBar: buildSearchBar(context),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 20.0),
            buildCategoryRow('Tendances Restaurant', context),
            // SizedBox(height: 10.0),
            // buildRestoList(context),
            SizedBox(height: 10.0),
            buildRestaurantList(context),
            buildCategoryRow('Category', context),
            SizedBox(height: 10.0),
            buildCategoryList(context),
          ],
        ),
      ),
    );
  }

  buildCategoryRow(String category, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "$category",
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w800,
          ),
        ),
        // FlatButton(
        //   child: Text(
        //     "See all (9)",
        //     style: TextStyle(
        //       color: Theme.of(context).accentColor,
        //     ),
        //   ),
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (BuildContext context) {
        //           return Trending();
        //         },
        //       ),
        //     );
        //   },
        // ),
      ],
    );
  }

  // buildScreen(BuildContext context) {
  //   final firestoreInstance = FirebaseFirestore.instance;
  //   return Container(
  //     child: StreamBuilder<QuerySnapshot>(
  //         stream: firestoreInstance.collection('resto').snapshots(),
  //         builder: (context, snapshot) {
  //           if (snapshot.data == null)
  //             return Center(child: CircularProgressIndicator());
  //           return ListView.builder(
  //             itemCount: snapshot.data.docs.length,
  //             itemBuilder: (context, index) {
  //               DocumentSnapshot product = snapshot.data.docs[index];
  //               return TrendingItem(
  //                   img: product['firstImage'],
  //                   title: 'test',
  //                   address: 'test',
  //                   rating: 'test');
  //             },
  //           );
  //         }),
  //   );
  // }

  buildCategoryList(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 6,
      child: ListView.builder(
        primary: false,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: categories == null ? 0 : categories.length,
        itemBuilder: (BuildContext context, int index) {
          Map cat = categories[index];

          return CategoryItem(
            cat: cat,
          );
        },
      ),
    );
  }

  buildRestaurantList(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.4,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: restaurants == null ? 0 : restaurants.length,
        itemBuilder: (BuildContext context, int index) {
          Map restaurant = restaurants[index];

          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: SlideItem(
              firstImage: restaurant["img"],
              name: restaurant["title"],
              description: restaurant["address"],
              rating: restaurant["rating"],
              ontap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) {
                      return Scaffold(
                        appBar: AppBar(
                          title: Text(
                            'BonCoin',
                            style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Pacifico',
                                color: Colors.teal[600]),
                          ),
                          centerTitle: true,
                          backgroundColor: Colors.orange[400],
                          automaticallyImplyLeading: true,
                        ),
                        backgroundColor: Colors.white,
                        body: Hero(
                          tag: restaurant['title'],
                          child: TrendingItem(
                            img: restaurant['img'],
                            address: restaurant['address'],
                            title: restaurant['title'],
                            rating: "4.5",
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
