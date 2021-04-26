//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ncaa_prs/blocs/application_bloc.dart';
import 'package:ncaa_prs/widgets/header.dart';
import 'package:ncaa_prs/widgets/progress.dart';
import 'package:provider/provider.dart';


class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {

  @override
  void initState() {
    final applicationBloc = Provider.of<ApplicationBloc>(context, listen: false);
    super.initState();
  }

  @override
  void dispose() {
    final applicationBloc = Provider.of<ApplicationBloc>(context, listen: false);
    applicationBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    final applicationBloc = Provider.of<ApplicationBloc>(context);
    var teams = applicationBloc.subTeams;

    return Scaffold(
      appBar: header(context, isAppTitle: false, titleText: "Favorite Teams"),
      body: Column(
        children: [
          if (teams != null && teams.isNotEmpty)
          Container(
            height: 738,
            child: ListView.builder(
              itemCount: teams.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 25),),
                    Dismissible(
                      background: Container(
                        color: Colors.red[900],
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.delete, color: Colors.white),
                            ],
                          )
                        ),
                      ),
                      key: Key(teams[index].type),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        applicationBloc.subTeams.removeAt(index);
                        applicationBloc.urls.removeAt(index);
                        setState(() {});
                      },
                      child: Container(
                        width: 400,
                        child: ListTile(
                          leading: Image.network(teams[index].teamImage),
                          title: Text(
                            teams[index].name,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(teams[index].type),
                          trailing: !teams[index].isToggled ?
                            Icon(Icons.arrow_drop_down_circle_outlined)
                            : Icon(Icons.arrow_drop_up),
                          onTap: () {
                            teams[index].isToggled = !teams[index].isToggled;
                            print(teams[index].isToggled);
                            setState(() {
                              Scrollable.ensureVisible(context);
                            });
                          },
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: !teams[index].isToggled ? Radius.circular(10) : Radius.circular(0),
                            bottomRight: !teams[index].isToggled ? Radius.circular(10) : Radius.circular(0)
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0,3),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (teams[index].isToggled)
                    Container(
                      width: 400,
                      child: Divider(
                        color: Colors.black,
                        height: 1,
                      ),
                    ),
                    if (teams[index].isToggled)
                    Container(
                      height: 500,
                      width: 400,
                      //color: Colors.grey,
                      child: ListView.separated(
                        itemCount: teams[index].athletes.length,
                        itemBuilder: (context, index2) {
                          return ListTile(
                            title: Text(
                              teams[index].athletes[index2].name,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            onTap: () => print('${teams[index].athletes[index2].name} tapped'),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            height: 1,
                            color: Colors.black,
                          );
                        },
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: Offset(0,6)
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      )
    );
  }
}
