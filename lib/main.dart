import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ncaa_prs/pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NCAA PRs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.amber,
      ),
      home: Home(),
    );
  }
}

