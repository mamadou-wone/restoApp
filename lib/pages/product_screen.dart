import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
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
  final firestoreInstance = FirebaseFirestore.instance;
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(height: 10.0),
          buildCategoryRow('Tendances Restaurant', context),
          SizedBox(height: 20.0),
          Container(
            height: MediaQuery.of(context).size.height / 2.4,
            width: MediaQuery.of(context).size.width,
            child: StreamBuilder<QuerySnapshot>(
                stream: firestoreInstance.collection('resto').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.data == null)
                    return Center(child: CircularProgressIndicator());
                  return ListView.builder(
                    primary: false,
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot product = snapshot.data.docs[index];
                      return SlideItem(
                        firstImage: product["firstImage"],
                        name: product["name"],
                        description: product["description"],
                        rating: "4.5",
                        ontap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) {
                                final List<String> images = [
                                  product['firstImage'],
                                  product['secondImage']
                                ];
                                return Scaffold(
                                  backgroundColor: Colors.white,
                                  body: Hero(
                                    tag: product['name'],
                                    child: CustomScrollView(
                                      slivers: <Widget>[
                                        SliverAppBar(
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
                                        SliverAppBar(
                                          automaticallyImplyLeading: false,
                                          elevation: 10.0,
                                          backgroundColor: Colors.grey[100],
                                          expandedHeight: 200,
                                          flexibleSpace: FlexibleSpaceBar(
                                            background: Container(
                                              child: GFCarousel(
                                                autoPlay: true,
                                                autoPlayCurve:
                                                    Curves.linearToEaseOut,
                                                aspectRatio: 16 / 9,
                                                items: images.map(
                                                  (url) {
                                                    return Container(
                                                      margin:
                                                          EdgeInsets.all(8.0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(5.0),
                                                        ),
                                                        child: Image.network(
                                                          url,
                                                          fit: BoxFit.cover,
                                                          width: 1000.0,
                                                          height: 3000.0,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SliverAppBar(
                                          automaticallyImplyLeading: false,
                                          backgroundColor: Colors.white,
                                          expandedHeight: 600,
                                          flexibleSpace: FlexibleSpaceBar(
                                            background: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 32.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      Text(
                                                        "Starting*",
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFF909090),
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w900,
                                                        ),
                                                      ),
                                                      RichText(
                                                        text:
                                                            TextSpan(children: [
                                                          TextSpan(
                                                            text: "\CFA ",
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xFF0000FF),
                                                                fontSize: 10),
                                                          ),
                                                          TextSpan(
                                                            text: product[
                                                                'price'],
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFF0000FF),
                                                              fontSize: 25,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          ),
                                                        ]),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    children: <Widget>[
                                                      Text(
                                                        product['name']
                                                                .replaceAll(
                                                                    "\n", " ") +
                                                            "\t\t\t\t",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w900,
                                                          fontSize: 30.0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    product["description"],
                                                    style: TextStyle(
                                                      color: Color(0xFF909090),
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 30.0,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                  );
                }),
          ),
          SizedBox(height: 20.0),
          buildCategoryRow('Category', context),
          SizedBox(height: 20.0),
          buildCategoryList(context),
        ],
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
      ],
    );
  }

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
}
