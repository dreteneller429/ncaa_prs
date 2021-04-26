import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Teams extends StatefulWidget {
  @override
  _TeamsState createState() => _TeamsState();
}

class _TeamsState extends State<Teams> {
  final _suggestions = <String>[

  ];
  final _saved = Set<String>();
  final _biggerFont = TextStyle(fontSize: 18.0);

  Widget _buildSuggestions() {
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemBuilder: /*1*/ (context, i) {
        if (i.isOdd) return Divider();

        final index = i ~/ 2;
        _suggestions.add('Alabama');
        _suggestions.add('Arkansas');
        _suggestions.add('Auburn');
        _suggestions.add('Boston College');
        _suggestions.add('BYU');
        _suggestions.add('Clemson');
        _suggestions.add('CU Boulder');
        _suggestions.add('Duke');
        _suggestions.add('Florida');
        _suggestions.add('FSU');
        _suggestions.add('Georgia Tech');
        _suggestions.add('Indiana');
        _suggestions.add('Louisville');
        _suggestions.add('LSU');
        _suggestions.add('NC State');
        _suggestions.add('Notre Dame');
        _suggestions.add('Pittsburgh');
        _suggestions.add('South Carolina');
        _suggestions.add('Syracuse');
        _suggestions.add('UGA');
        _suggestions.add('UNC Chapel Hill');
        _suggestions.add('Virginia');
        _suggestions.add('Virginia Tech');
        _suggestions.add('Wake Forest');

        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(String team) {
    final alreadySaved = _saved.contains(team);
    return ListTile(
      title: Text(
        team,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(team);
          } else {
            _saved.add(team);
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final tiles = _saved.map(
            (String team) {
              return ListTile(
                title: Text(
                  team,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return Scaffold(
            appBar: AppBar(
              title: Text("Teams You're Following"),
            ),
            body: ListView(children: divided),
          );
        }, // ...to here.
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NCAA D1 Teams'),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }
}