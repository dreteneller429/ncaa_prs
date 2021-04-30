import 'package:flutter/material.dart';
import 'package:ncaa_prs/blocs/application_bloc.dart';
import 'package:provider/provider.dart';

class ActivityFeed extends StatefulWidget {
  @override
  _ActivityFeedState createState() => _ActivityFeedState();
}

class _ActivityFeedState extends State<ActivityFeed> {

  @override
  void initState() {
    super.initState();
  }

  // @override
  // void dispose() {
  //   final applicationBloc = Provider.of<ApplicationBloc>(context, listen: false);
  //   applicationBloc.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicationBloc>(context);
    final teamUrl = 'https://www.tfrrs.org/teams/GA_college_m_Georgia_Tech.html';
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Activity Feed'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.0),
          ),
          Container(
            child: FlatButton(
              child: Text("button"), 
              height: 100.0,
              onPressed: () => applicationBloc.getTeam(teamUrl),
            ),
          ),
          if (applicationBloc.athletes != null
            && applicationBloc.athletes.isNotEmpty)
          Stack(
            children: [
              Container(
                height: 500,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  backgroundBlendMode: BlendMode.darken,
                ),
              ),
              Container(
                height: 500,
                child: ListView.builder(
                  itemCount: applicationBloc.athletes.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        applicationBloc.athletes[index].name,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onTap: () => print('${applicationBloc.athletes[index].name} tapped'),
                    );
                  },
                ),
              ),
            ],
          ), 
        ],
      ),
    );
  }
}

class ActivityFeedItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Activity Feed Item');
  }
}
