//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ncaa_prs/widgets/header.dart';
//import 'package:rendezvous_dev/widgets/progress.dart';

//final CollectionReference usersRef = FirebaseFirestore.instance.collection('users');

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  //List<dynamic> users = [];

  @override
  void initState(){
    //getUsers();
    //getUserById();
    //createUser();
    // updateUser();
    // deleteUser();
    super.initState();
  }

  // void createUser() {
  //   usersRef.doc('asdfasdf').set({
  //     'username': 'Jeff',
  //     'postCount': 7,
  //     'isAdmin': true
  //   });
  // }

  // void updateUser() async {
  //   final doc = await usersRef.doc('5Uy2UJ6xLmDRGQalUqid').get();
  //   if (doc.exists) {
  //     await doc.reference.update({
  //     'username': 'John',
  //     'postCount': 7,
  //     'isAdmin': true
  //     });
  //   }
  // }

  // void deleteUser() async {
  //   final doc = await usersRef.doc('5Uy2UJ6xLmDRGQalUqid').get();
  //   if (doc.exists) {
  //     await doc.reference.delete();
  //   }
  // }

  // void getUsers() async {
  //   final snapshot = await usersRef.get();

  //   setState(() {
  //     users = snapshot.docs;
  //   });

  //   // snapshot.docs.forEach((doc) {
  //   //   print(doc.data());
  //   // });
  //   // usersRef.get().then((QuerySnapshot snapshot) => {
  //   //   snapshot.docs.forEach((doc) { 
  //   //     print(doc.data());
  //   //   })
  //   // });
  // }

  // void getUserById() async {
  //   final id = 'ImsVVCS7wynmP6lHJRoO';
  //   final doc = await usersRef.doc(id).get();
  //   print(doc.data());
  // }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: header(context, isAppTitle: true),
      // body: StreamBuilder<QuerySnapshot>(
      //   stream: usersRef.snapshots(),
      //   builder: (context, snapshot) {
      //     if (!snapshot.hasData) {
      //       return circularProgress();
      //     } 
      //     final children = snapshot.data.docs
      //       .map((doc) => Text(doc['username'])).toList();
      //     return Container(
      //       child: ListView(
      //         children: children,
      //       )
      //     );
      //   },
      // )
    );
  }
}
