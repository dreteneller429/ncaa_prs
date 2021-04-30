import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ncaa_prs/models/user.dart';
import 'package:ncaa_prs/widgets/header.dart';
import 'package:ncaa_prs/widgets/progress.dart';

import 'edit_profile.dart';
import 'home.dart';

class Profile extends StatefulWidget {
  Profile({this.profileId});
  
  final String profileId;

  @override
  _ProfileState createState() => _ProfileState();
}


class _ProfileState extends State<Profile> {
  final String currentUserId = currentUser?.id;

  Column buildCountColumn(String label, int count) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          count.toString(),
          style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
        ),
        Container(
          margin: EdgeInsets.only(top: 4.0),
          child: Text(
            label,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  } 

  editProfile() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => 
    EditProfile(currentUserId: currentUserId)));
  }

  Container buildButton({ String text, Function function }) {
    return Container(
      padding: EdgeInsets.only(top: 2.0),
      child: TextButton(
        onPressed: function,
        child: Container(
          width: 250.0,
          height: 27.0,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.blue,
            border: Border.all(
              color: Colors.blue,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
    );
  }

  buildProfileButton() {
    // viewing your own profile - should show edit profile button
    var isProfileOwner = currentUserId == widget.profileId;
    if (isProfileOwner) {
      return buildButton(
        text: 'Edit Profile',
        function: editProfile,
      );
    }
  }
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, titleText: 'Profile'),
    );
  }
}
