import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:restoapp/modals/product.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final firestoreInstance = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreInstance.collection('resto').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.data == null)
            return Center(child: CircularProgressIndicator());
          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot product = snapshot.data.docs[index];
              return ProductModel(
                name: product['name'],
                price: product['price'],
                firstImage: product['firstImage'],
                onTap: () {
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
                                  automaticallyImplyLeading: true,
                                  elevation: 50.0,
                                  centerTitle: true,
                                  backgroundColor: Colors.orange[400],
                                  title: Text(
                                    'BonCoin',
                                    style: TextStyle(
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Pacifico',
                                        color: Colors.teal[600]),
                                  ),
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
                                        autoPlayCurve: Curves.linearToEaseOut,
                                        aspectRatio: 16 / 9,
                                        items: images.map(
                                          (url) {
                                            return Container(
                                              margin: EdgeInsets.all(8.0),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.all(
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
                                  elevation: 10.0,
                                  backgroundColor: Colors.white,
                                  expandedHeight: 600,
                                  flexibleSpace: FlexibleSpaceBar(
                                    background: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          ListTile(
                                            title: Text(
                                              product['name'],
                                              style: TextStyle(
                                                  fontFamily: 'Pacifico',
                                                  color: Colors.orange[400],
                                                  fontSize: 25.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            trailing: SizedBox(
                                              // width: 250.0,
                                              child: ScaleAnimatedTextKit(
                                                  duration:
                                                      Duration(seconds: 3),
                                                  onTap: () {
                                                    print("Tap Event");
                                                  },
                                                  text: [
                                                    product['price'],
                                                    "CFA",
                                                  ],
                                                  textStyle: TextStyle(
                                                      color: Colors.orange[400],
                                                      fontSize: 25.0,
                                                      fontFamily: "Pirata"),
                                                  textAlign: TextAlign.start,
                                                  alignment: AlignmentDirectional
                                                      .topStart // or Alignment.topLeft
                                                  ),
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          Container(
                                            child: SizedBox(
                                              width: 250.0,
                                              child: ColorizeAnimatedTextKit(
                                                  speed: Duration(seconds: 5),
                                                  onTap: () {
                                                    print("Tap Event");
                                                  },
                                                  text: [
                                                    product['description']
                                                  ],
                                                  textStyle: TextStyle(
                                                      fontSize: 30.0,
                                                      fontFamily: "Pirata"),
                                                  colors: [
                                                    Colors.purple,
                                                    Colors.blue,
                                                    Colors.yellow,
                                                    Colors.red,
                                                  ],
                                                  textAlign: TextAlign.start,
                                                  alignment: AlignmentDirectional
                                                      .topStart // or Alignment.topLeft
                                                  ),
                                            ),
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
        },
      ),
      // body: Column(
      //   children: [
      //     Expanded(
      //       child: StaggeredGridView.countBuilder(
      //           crossAxisCount: 2,
      //           itemCount: 500,
      //           mainAxisSpacing: 16.0,
      //           crossAxisSpacing: 16.0,
      //           itemBuilder: (context, index) {
      //             return Container(
      //               height: 100,
      //               width: 100,
      //               color: Colors.blue,
      //             );
      //           },
      //           staggeredTileBuilder: (index) => StaggeredTile.fit(1)),
      //     ),
      //   ],
      // ),
      // body: Center(
      //   child: FlatButton(
      //     child: Text('tap'),
      //     onPressed: () => {
      //       firestoreInstance.collection('resto').get().then((querySnapshot) {
      //         querySnapshot.docs.forEach((data) {
      //           print(data['name']);
      //         });
      //       }),
      //     },
      //   ),
      // ),
    );
  }
}
