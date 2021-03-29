import 'package:flutter/material.dart';

class Teams extends StatefulWidget {
  @override
  _TeamsState createState() => _TeamsState();
}

class _TeamsState extends State<Teams> {

    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Teams'),
            backgroundColor: Theme.of(context).primaryColor,
          ),
          body: Text('Hello World')
        ),
      );
    }
}