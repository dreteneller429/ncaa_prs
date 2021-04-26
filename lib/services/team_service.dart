import 'package:http/http.dart' as http;
import 'package:ncaa_prs/models/athlete.dart';
import 'dart:convert' as convert;

import 'package:ncaa_prs/models/team.dart';

class TeamService {

  Team team;

  Future<List<Athlete>> fetchTeam(String teamUrl) async {
    //var teamUrl = 'https://www.tfrrs.org/teams/GA_college_m_Georgia_Tech.html';
    var url = 'https://ncaaprs-backend.herokuapp.com/api/athletes/?param1=${teamUrl}';
    var response = await http.get(url);
    var json = convert.jsonDecode(response.body);
    var athletes = json['athletes'];
    
    List<Athlete> allanDrosky = new List<Athlete>();

    var image;
    var teamTitle;
    var teamType;

    athletes.forEach((athlete) {
      var decodedAthlete = convert.jsonDecode(convert.jsonDecode(athlete));
      var name = decodedAthlete['name'];
      var prs = decodedAthlete['prs'] as List;
      image = decodedAthlete['logo'];
      teamTitle = decodedAthlete['title'];
      teamType = decodedAthlete['teamType'];

      var events = new List();
      var athletePrs = new List();

      for (int i = 0; i < prs.length; i++) {
        if (i%2 == 0) {
          events.add(prs[i]);
        } else {
          athletePrs.add(prs[i]);
        }
      }

      Athlete alanDrosky = new Athlete(name: name, events: events, prs: athletePrs);
      allanDrosky.add(alanDrosky);
    });

    team = new Team(name: teamTitle, type: teamType, teamImage: image, 
      athletes: allanDrosky, isToggled: false, teamUrl: teamUrl);

    return allanDrosky;
  }
}