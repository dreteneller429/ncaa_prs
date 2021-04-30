
import 'package:flutter/material.dart';
import 'package:ncaa_prs/pages/home.dart';
import 'package:provider/provider.dart';

import 'blocs/application_bloc.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ApplicationBloc(),
      child: MaterialApp(
        title: 'NCAA PRs',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.black,
          accentColor: Colors.amber,
        ),
        home: Home(),
      ),
    );
  }
}

