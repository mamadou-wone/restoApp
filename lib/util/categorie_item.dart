import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/carousel/gf_carousel.dart';
import 'package:restoapp/util/slide_item.dart';
import 'package:restoapp/util/trending_item.dart';

class CategoryItem extends StatelessWidget {
  final Map cat;

  CategoryItem({this.cat});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Stack(
          children: <Widget>[
            Image.asset(
              cat["img"],
              height: MediaQuery.of(context).size.height / 6,
              width: MediaQuery.of(context).size.height / 6,
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  // Add one stop for each color. Stops should increase from 0 to 1
                  stops: [0.2, 0.7],
                  colors: [
                    cat['color1'],
                    cat['color2'],
                  ],
                  // stops: [0.0, 0.1],
                ),
              ),
              height: MediaQuery.of(context).size.height / 6,
              width: MediaQuery.of(context).size.height / 6,
            ),
            Center(
              child: GestureDetector(
                child: Container(
                  height: MediaQuery.of(context).size.height / 6,
                  width: MediaQuery.of(context).size.height / 6,
                  padding: const EdgeInsets.all(1),
                  constraints: BoxConstraints(
                    minWidth: 20,
                    minHeight: 20,
                  ),
                  child: Center(
                    child: Text(
                      cat["name"],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                onTap: () async {
                  final firestoreInstance = FirebaseFirestore.instance;
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
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
                          body: ListView(
                            children: <Widget>[
                              SizedBox(height: 10.0),
                              buildCategoryRow(cat['name'], context),
                              SizedBox(height: 20.0),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height / 2.4,
                                width: MediaQuery.of(context).size.width,
                                child: StreamBuilder<QuerySnapshot>(
                                    stream: firestoreInstance
                                        .collection('resto')
                                        .where("category",
                                            isEqualTo: cat["name"])
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      if (snapshot.data == null)
                                        return Center(
                                            child: CircularProgressIndicator());
                                      return ListView.builder(
                                        primary: false,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: snapshot.data.docs.length,
                                        itemBuilder: (context, index) {
                                          DocumentSnapshot product =
                                              snapshot.data.docs[index];
                                          return SlideItem(
                                            firstImage: product["firstImage"],
                                            name: product["name"],
                                            description: product["description"],
                                            rating: "4.5",
                                            ontap: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute<void>(
                                                  builder:
                                                      (BuildContext context) {
                                                    final List<String> images =
                                                        [
                                                      product['firstImage'],
                                                      product['secondImage']
                                                    ];
                                                    return Scaffold(
                                                      backgroundColor:
                                                          Colors.white,
                                                      body: Hero(
                                                        tag: product['name'],
                                                        child: CustomScrollView(
                                                          slivers: <Widget>[
                                                            SliverAppBar(
                                                              title: Text(
                                                                'BonCoin',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        25.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontFamily:
                                                                        'Pacifico',
                                                                    color: Colors
                                                                            .teal[
                                                                        600]),
                                                              ),
                                                              centerTitle: true,
                                                              backgroundColor:
                                                                  Colors.orange[
                                                                      400],
                                                              automaticallyImplyLeading:
                                                                  true,
                                                            ),
                                                            SliverAppBar(
                                                              automaticallyImplyLeading:
                                                                  false,
                                                              elevation: 10.0,
                                                              backgroundColor:
                                                                  Colors.grey[
                                                                      100],
                                                              expandedHeight:
                                                                  200,
                                                              flexibleSpace:
                                                                  FlexibleSpaceBar(
                                                                background:
                                                                    Container(
                                                                  child:
                                                                      GFCarousel(
                                                                    autoPlay:
                                                                        true,
                                                                    autoPlayCurve:
                                                                        Curves
                                                                            .linearToEaseOut,
                                                                    aspectRatio:
                                                                        16 / 9,
                                                                    items: images
                                                                        .map(
                                                                      (url) {
                                                                        return Container(
                                                                          margin:
                                                                              EdgeInsets.all(8.0),
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.all(
                                                                              Radius.circular(5.0),
                                                                            ),
                                                                            child:
                                                                                Image.network(
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
                                                              automaticallyImplyLeading:
                                                                  false,
                                                              backgroundColor:
                                                                  Colors.white,
                                                              expandedHeight:
                                                                  600,
                                                              flexibleSpace:
                                                                  FlexibleSpaceBar(
                                                                background:
                                                                    Padding(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          32.0),
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: <
                                                                            Widget>[
                                                                          Text(
                                                                            "Starting*",
                                                                            style:
                                                                                TextStyle(
                                                                              color: Color(0xFF909090),
                                                                              fontSize: 20,
                                                                              fontWeight: FontWeight.w900,
                                                                            ),
                                                                          ),
                                                                          RichText(
                                                                            text:
                                                                                TextSpan(children: [
                                                                              TextSpan(
                                                                                text: "\CFA ",
                                                                                style: TextStyle(color: Color(0xFF0000FF), fontSize: 10),
                                                                              ),
                                                                              TextSpan(
                                                                                text: product['price'],
                                                                                style: TextStyle(
                                                                                  color: Color(0xFF0000FF),
                                                                                  fontSize: 25,
                                                                                  fontWeight: FontWeight.w700,
                                                                                ),
                                                                              ),
                                                                            ]),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      Row(
                                                                        children: <
                                                                            Widget>[
                                                                          Text(
                                                                            product['name'].replaceAll("\n", " ") +
                                                                                "\t\t\t\t",
                                                                            style:
                                                                                TextStyle(
                                                                              fontWeight: FontWeight.w900,
                                                                              fontSize: 30.0,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      Text(
                                                                        product[
                                                                            "description"],
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Color(0xFF909090),
                                                                          fontWeight:
                                                                              FontWeight.w300,
                                                                          fontSize:
                                                                              30.0,
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            20,
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
                            ],
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
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
      ],
    );
  }
}
