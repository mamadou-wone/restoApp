import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:restoapp/util/restaurants.dart';
import 'package:restoapp/util/search_card.dart';
import 'package:restoapp/util/trending_item.dart';

class Trending extends StatelessWidget {
  final firestoreInstance = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Trending Restaurants"),
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestoreInstance.collection('resto').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.data == null)
            return Center(child: CircularProgressIndicator());
          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot product = snapshot.data.docs[index];
              return TrendingItem(
                img: product["firstImage"],
                title: product["name"],
                address: product["description"],
                rating: '2',
                // rating: restaurant["rating"],
              );
            },
          );
        },
      ),
      // body: Padding(
      //   padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      //   child: ListView(
      //     children: <Widget>[
      //       SearchCard(),
      //       SizedBox(height: 10.0),
      //       ListView.builder(
      //         primary: false,
      //         shrinkWrap: true,
      //         physics: NeverScrollableScrollPhysics(),
      //         itemCount: restaurants == null ? 0 : restaurants.length,
      //         itemBuilder: (BuildContext context, int index) {
      //           Map restaurant = restaurants[index];

      //           return TrendingItem(
      //             img: restaurant["img"],
      //             title: restaurant["title"],
      //             address: restaurant["address"],
      //             rating: restaurant["rating"],
      //           );
      //         },
      //       ),
      //       SizedBox(height: 10.0),
      //     ],
      //   ),
      // ),
    );
  }
}
