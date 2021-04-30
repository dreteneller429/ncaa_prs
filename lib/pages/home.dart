import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ncaa_prs/models/user.dart';
import 'package:ncaa_prs/pages/activity_feed.dart';
import 'package:ncaa_prs/pages/create_account.dart';
import 'package:ncaa_prs/pages/profile.dart';
import 'package:ncaa_prs/pages/search.dart';
import 'package:ncaa_prs/pages/timeline.dart';
import 'package:ncaa_prs/pages/teams.dart';

final timestamp = DateTime.now();
User currentUser;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isAuth = false;
  PageController pageController = PageController();
  int pageIndex = 0;

  @override
  void initState() { 
    super.initState();
    pageController = PageController();
    // Detects when user signed in or out
    // Reauthenticate user when app is opened
  }

  void handleSignIn() {

        setState(() {
          isAuth = true;
        });

  }




  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }


  void onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  //responsible for changing page in pageview
  void onTap(int pageIndex) {
    pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 200),
      curve: Curves.bounceInOut
    );
  }

  Scaffold buildAuthScreen() {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          Timeline(),
          ActivityFeed(),
          Teams(),
          Search(),
          Profile(profileId: currentUser?.id), // ? null aware id
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: pageIndex,
        onTap: onTap,
        activeColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.whatshot_outlined),),
          BottomNavigationBarItem(icon: Icon(Icons.notifications_active_outlined),),
          BottomNavigationBarItem(icon: Icon(Icons.run_circle_outlined, size: 40.0),),
          BottomNavigationBarItem(icon: Icon(Icons.search),),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined),),
        ],
      ),
    );
  }

  Widget buildUnAuthScreen() {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('NCAA PRs', 
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 75.0,
                color: Colors.white,
              )
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  buildAuthScreen();
  }
}
