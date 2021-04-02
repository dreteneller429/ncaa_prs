import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ncaa_prs/models/user.dart';
import 'package:ncaa_prs/pages/activity_feed.dart';
import 'package:ncaa_prs/pages/create_account.dart';
import 'package:ncaa_prs/pages/profile.dart';
import 'package:ncaa_prs/pages/search.dart';
import 'package:ncaa_prs/pages/timeline.dart';
import 'package:ncaa_prs/pages/teams.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();
final usersRef = FirebaseFirestore.instance.collection('users');
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
    googleSignIn.onCurrentUserChanged.listen((account) {
      handleSignIn(account);
    }, onError: (err) {
      print('Error signing in: $err');
    });
    // Reauthenticate user when app is opened
    googleSignIn.signInSilently(suppressErrors: false).then((account) {
        handleSignIn(account);
      }).catchError((err) {
        print('Error signing in: $err');
      });
  }

  void handleSignIn(GoogleSignInAccount account) {
    if (account != null) {
      createUserInFirestore();
        setState(() {
          isAuth = true;
        });
      } else {
        setState(() {
          isAuth = false;
        });
      }
  }

  void createUserInFirestore() async {
    // 1) check if user exists in users collection in database 
    //    according to their id
    final user = googleSignIn.currentUser;
    var doc = await usersRef.doc(user.id).get();
    
    if (!doc.exists) {
    // 2) if user doesn't exist, take them to the create account page
      final username = await Navigator.push(context, 
        MaterialPageRoute(builder: (context) => CreateAccount()));

    // 3) get username from create account, use it to make new user 
    //    document in users collection
      await usersRef.doc(user.id).set({
        'id': user.id,
        'username': username,
        'photoUrl': user.photoUrl,
        'email': user.email,
        'displayName': user.displayName,
        'bio': '',
        'timestamp': timestamp,
      });

      doc = await usersRef.doc(user.id).get();
    }

    currentUser = User.fromDocument(doc);
    print(currentUser);
    print(currentUser.username);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void login() {
    googleSignIn.signIn();
  }

  void logout() {
    googleSignIn.signOut();
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
            GestureDetector( // let image act as button
            onTap: () => login(),
              child: Container(
                width: 260.0,
                height: 60.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/google_signin_button.png'),
                    fit: BoxFit.cover // cover whole space of container
                  )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isAuth ? buildAuthScreen() : buildUnAuthScreen();
  }
}
