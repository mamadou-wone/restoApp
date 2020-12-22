import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
                  var result = await firestoreInstance
                      .collection("resto")
                      .where("category", isEqualTo: cat["name"])
                      .get();

                  result.docs.forEach(
                    (element) {
                      // print(element['name']);
                      Navigator.of(context).push(
                        MaterialPageRoute(
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
                              body: Container(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: ListView.builder(
                                  //       primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: element.data().length == null
                                      ? 0
                                      : element.data().length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10.0),
                                        child: SlideItem(
                                          firstImage: element['firstImage'],
                                          name: element['name'],
                                          description: element['description'],
                                          rating: "4.5",
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                  // print(cat["name"]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // buildRestaurantList(BuildContext context) {
  //   return Container(
  //     height: MediaQuery.of(context).size.height / 2.4,
  //     width: MediaQuery.of(context).size.width,
  //     child: ListView.builder(
  //       primary: false,
  //       shrinkWrap: true,
  //       scrollDirection: Axis.horizontal,
  //       itemCount: restaurants == null ? 0 : restaurants.length,
  //       itemBuilder: (BuildContext context, int index) {
  //         Map restaurant = restaurants[index];

  //         return Padding(
  //           padding: const EdgeInsets.only(right: 10.0),
  //           child: SlideItem(
  //             firstImage: restaurant["img"],
  //             name: restaurant["title"],
  //             description: restaurant["address"],
  //             rating: restaurant["rating"],
  //             ontap: () {
  //               Navigator.of(context).push(
  //                 MaterialPageRoute<void>(
  //                   builder: (BuildContext context) {
  //                     return Scaffold(
  //                       appBar: AppBar(
  //                         title: Text(
  //                           'BonCoin',
  //                           style: TextStyle(
  //                               fontSize: 25.0,
  //                               fontWeight: FontWeight.bold,
  //                               fontFamily: 'Pacifico',
  //                               color: Colors.teal[600]),
  //                         ),
  //                         centerTitle: true,
  //                         backgroundColor: Colors.orange[400],
  //                         automaticallyImplyLeading: true,
  //                       ),
  //                       backgroundColor: Colors.white,
  //                       body: Hero(
  //                         tag: restaurant['title'],
  //                         child: TrendingItem(
  //                           img: restaurant['img'],
  //                           address: restaurant['address'],
  //                           title: restaurant['title'],
  //                           rating: "4.5",
  //                         ),
  //                       ),
  //                     );
  //                   },
  //                 ),
  //               );
  //             },
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }
}
