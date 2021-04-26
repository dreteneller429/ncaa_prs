import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ncaa_prs/models/athlete.dart';
import 'package:ncaa_prs/models/team.dart';
import 'package:ncaa_prs/services/team_service.dart';

class ApplicationBloc with ChangeNotifier {
  final teamService = TeamService();
  List<Athlete> athletes;
  Team team;
  List<Team> subTeams = new List<Team>();
  List<String> urls = new List<String>();

  ApplicationBloc() {
    
  }

  getTeam(teamUrl) async {
    print(urls);
    if (!urls.contains(teamUrl)) {
      urls.add(teamUrl);
      athletes = await teamService.fetchTeam(teamUrl);
      team = teamService.team;
      subTeams.add(team);
      notifyListeners();
    }
  }
}