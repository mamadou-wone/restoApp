import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
                firstImage: product['firstImage'],
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
