import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ncaa_prs/models/user.dart';
import 'package:ncaa_prs/widgets/custom_image.dart';
import 'package:ncaa_prs/widgets/progress.dart';
import 'home.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var searchController = TextEditingController();

  get searchResultsFuture => null;

  void handleSearch(String query) {
  }

  void clearSearch() {
    searchController.clear();
  }


  AppBar buildSearchField() {
    return AppBar(
      backgroundColor: Colors.white,
      title: TextFormField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: 'Search for an athlete...',
          filled: true,
          prefixIcon: Icon(
            Icons.run_circle_outlined,
            size: 28.0,
          ),
          suffixIcon: IconButton(
            icon: Icon(Icons.clear),
            onPressed: clearSearch,
          )
        ),
        onFieldSubmitted: handleSearch,
      ),
    );
  }

  Container buildNoContent() {
    //final orientation = MediaQuery.of(context).orientation;
    return Container(
      child: Center(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            // SvgPicture.asset(
            //   'assets/images/search.svg', 
            //   height: orientation == Orientation.portrait ? 300.0 : 200.0,
            // ),
            Text('Find Athletes', textAlign: TextAlign.center, style: 
            TextStyle(
              color: Colors.white, 
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w600,
              fontSize: 60.0,
            ),)
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.8),
      appBar: buildSearchField(),
    );
  }
}

class QuerySnapshot {
}

class UserResult extends StatelessWidget {
  
  UserResult(this.user);
  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor.withOpacity(0.7),
      child: Column(children: <Widget>[
        GestureDetector(
          onTap: () => print('tapped'),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey,
              backgroundImage: CachedNetworkImageProvider(user.photoUrl),
            ),
            title: Text(user.displayName, style: TextStyle(color: 
            Colors.white, fontWeight: FontWeight.bold),),
            subtitle: Text(user.username, style: TextStyle(color: Colors.white),),
          ),
        ),
        Divider(
          height: 2.0,
          color: Colors.white54,
        ),
      ],),
    );
  }
}
