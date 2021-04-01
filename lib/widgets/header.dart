import 'package:flutter/material.dart';

AppBar header(context, { bool isAppTitle = false, String titleText = '',
  removeBackButton = false }) {
  return AppBar(
    automaticallyImplyLeading: removeBackButton ? false : true,
    title: Text(
      isAppTitle ? 'NCAA PRs' : titleText,
      style: TextStyle(
        color: Colors.white,
        fontFamily: isAppTitle ? 'Raleway' : '',
        fontSize: isAppTitle ? 40.0 : 20.0,
      ),
    ),
    centerTitle: true,
    backgroundColor: Theme.of(context).primaryColor,
  );
}
