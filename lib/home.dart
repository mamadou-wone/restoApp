import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final firestoreIntance = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Text('tap'),
          onPressed: () {
            firestoreIntance.collection('resto').get().then((querySnapshot) {
              querySnapshot.docs.forEach((element) {
                print(element["name"]);
              });
            });
          },
        ),
      ),
    );
  }
}
