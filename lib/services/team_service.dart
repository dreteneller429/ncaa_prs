import 'package:http/http.dart' as http;
import 'package:ncaa_prs/models/athlete.dart';
import 'dart:convert' as convert;

import 'package:ncaa_prs/models/team.dart';

class TeamService {

  Team team;

  void setTeamEvent(event, allanDrosky) {
    event.forEach((athlete) {
      var decodedAthlete = convert.jsonDecode(convert.jsonDecode(athlete));
      var name = decodedAthlete['name'];
      var prs = decodedAthlete['prs'] as List;
      var link = decodedAthlete['link'];
      link = "https:" + link;
      var athletePrs = new List();
      var events = new List();
      for (int i = 0; i < prs.length; i++) {
        if (i%2 == 0) {
          prs[i].trim();
          prs[i] = prs[i].replaceAll("\n", "");
          prs[i] = prs[i].replaceAll("\t", "");
          prs[i].trim();
          print(prs[i]);
          switch (prs[i]) {
            case "LJ":
              {
                prs[i] = "Long Jump";
              }
              break;
            case "TJ":
              {
                prs[i] = "Triple Jump";
              }
              break;
            case "HJ":
              {
                prs[i] = "High Jump";
              }
              break;
            case "WT":
              {
                prs[i] = "Weight Throw";
              }
              break;
            case "HT":
              {
                prs[i] = "Hammer Throw";
              }
              break;
            case "SP":
              {
                prs[i] = "Shotput";
              }
              break;
            case "DT":
              {
                prs[i] = "Discus";
              }
              break;
            case "JT":
              {
                prs[i] = "Javelin";
              }
              break;
            case "PV":
              {
                prs[i] = "Pole Vault";
              }
              break;
            case "60H":
              {
                prs[i] = "60 Hurdles";
              }
              break;
            case "100H":
              {
                prs[i] = "100 Hurdles";
              }
              break;
            case "110H":
              {
                prs[i] = "110 Hurdles";
              }
              break;
            case "400H":
              {
                prs[i] = "400 Hurdles";
              }
              break;
            case "MILE":
              {
                prs[i] = "Mile";
              }
              break;
            case "3000S":
              {
                prs[i] = "3000 Steeple";
              }
              break;
            case "10,000":
              {
                prs[i] = "10000";
              }
              break;
          }
          events.add(prs[i]);
        } else {
          athletePrs.add(prs[i]);
        }
      }
    print(events);
      Athlete alanDrosky = new Athlete(name: name, events: events, prs: athletePrs, link: link);
      allanDrosky.add(alanDrosky);

    });
  }

  Future<List<Athlete>> fetchTeam(String teamUrl) async {
    //var teamUrl = 'https://www.tfrrs.org/teams/GA_college_m_Georgia_Tech.html';
    var url = 'https://ncaaprs-backend.herokuapp.com/api/athletes/?param1=${teamUrl}';
    var response = await http.get(Uri.parse(url));
    print("HERE");
    var json = convert.jsonDecode(response.body);
    var athletes = json['athletes'];
    List<Athlete> allanDrosky = new List<Athlete>();

    var athletesLJ = json['athletesLJ'];
    List<Athlete> allanDroskyLJ = new List<Athlete>();
    setTeamEvent(athletesLJ, allanDroskyLJ);

    var athletesTJ = json['athletesTJ'];
    List<Athlete> allanDroskyTJ= new List<Athlete>();
    setTeamEvent(athletesTJ, allanDroskyTJ);

    var athletesHJ = json['athletesHJ'];
    List<Athlete> allanDroskyHJ= new List<Athlete>();
    setTeamEvent(athletesHJ, allanDroskyHJ);

    var athletesWT = json['athletesWT'];
    List<Athlete> allanDroskyWT= new List<Athlete>();
    setTeamEvent(athletesWT, allanDroskyWT);

    var athletesHT = json['athletesHT'];
    List<Athlete> allanDroskyHT= new List<Athlete>();
    setTeamEvent(athletesHT, allanDroskyHT);

    var athletesST = json['athletesST'];
    List<Athlete> allanDroskyST= new List<Athlete>();
    setTeamEvent(athletesST, allanDroskyST);

    var athletesDT = json['athletesDT'];
    List<Athlete> allanDroskyDT= new List<Athlete>();
    setTeamEvent(athletesDT, allanDroskyDT);

    var athletesJT = json['athletesJT'];
    List<Athlete> allanDroskyJT= new List<Athlete>();
    setTeamEvent(athletesJT, allanDroskyJT);

    var athletesPV = json['athletesPV'];
    List<Athlete> allanDroskyPV= new List<Athlete>();
    setTeamEvent(athletesPV, allanDroskyPV);

    var athletes60 = json['athletes60'];
    List<Athlete> allanDrosky60= new List<Athlete>();
    setTeamEvent(athletes60, allanDrosky60);

    var athletes60H = json['athletes60H'];
    List<Athlete> allanDrosky60H = new List<Athlete>();
    setTeamEvent(athletes60H, allanDrosky60H);

    var athletes100 = json['athletes100'];
    List<Athlete> allanDrosky100= new List<Athlete>();
    setTeamEvent(athletes100, allanDrosky100);

    var athletes100H = json['athletes100H'];
    List<Athlete> allanDrosky100H= new List<Athlete>();
    setTeamEvent(athletes100H, allanDrosky100H);

    var athletes110H = json['athletes110H'];
    List<Athlete> allanDrosky110H= new List<Athlete>();
    setTeamEvent(athletes110H, allanDrosky110H);

    var athletes200 = json['athletes200'];
    List<Athlete> allanDrosky200= new List<Athlete>();
    setTeamEvent(athletes200, allanDrosky200);

    var athletes400 = json['athletes400'];
    List<Athlete> allanDrosky400= new List<Athlete>();
    setTeamEvent(athletes400, allanDrosky400);

    var athletes400H = json['athletes400H'];
    List<Athlete> allanDrosky400H= new List<Athlete>();
    setTeamEvent(athletes400H, allanDrosky400H);

    var athletes600 = json['athletes600'];
    List<Athlete> allanDrosky600= new List<Athlete>();
    setTeamEvent(athletes600, allanDrosky600);

    var athletes800 = json['athletes800'];
    List<Athlete> allanDrosky800= new List<Athlete>();
    setTeamEvent(athletes800, allanDrosky800);

    var athletes1000 = json['athletes1000'];
    List<Athlete> allanDrosky1000= new List<Athlete>();
    setTeamEvent(athletes1000, allanDrosky1000);

    var athletes1500 = json['athletes1500'];
    List<Athlete> allanDrosky1500= new List<Athlete>();
    setTeamEvent(athletes1500, allanDrosky1500);

    var athletesMile = json['athletesMile'];
    List<Athlete> allanDroskyMile= new List<Athlete>();
    setTeamEvent(athletesMile, allanDroskyMile);

    var athletes3000 = json['athletes3000'];
    List<Athlete> allanDrosky3000= new List<Athlete>();
    setTeamEvent(athletes3000, allanDrosky3000);

    var athletes3000S = json['athletes3000S'];
    List<Athlete> allanDrosky3000S= new List<Athlete>();
    setTeamEvent(athletes3000S, allanDrosky3000S);
    var athletes5000 = json['athletes5000'];
    List<Athlete> allanDrosky5000= new List<Athlete>();

    setTeamEvent(athletes5000, allanDrosky5000);

    var athletes10000 = json['athletes10000'];
    List<Athlete> allanDrosky10000 = new List<Athlete>();
    setTeamEvent(athletes10000, allanDrosky10000);

    var athletes5k = json['athletes5k'];
    List<Athlete> allanDrosky5k= new List<Athlete>();
    setTeamEvent(athletes5k, allanDrosky5k);

    var athletes6k = json['athletes6k'];
    List<Athlete> allanDrosky6k= new List<Athlete>();
    setTeamEvent(athletes6k, allanDrosky6k);

    var athletes8k = json['athletes8k'];
    List<Athlete> allanDrosky8k= new List<Athlete>();
    setTeamEvent(athletes8k, allanDrosky8k);

    var athletes10k = json['athletes10k'];
    List<Athlete> allanDrosky10k = new List<Athlete>();
    setTeamEvent(athletes10k, allanDrosky10k);











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
      var link = decodedAthlete['link'];
      link = "https:" + link;

      for (int i = 0; i < prs.length; i++) {
        if (i%2 == 0) {
          events.add(prs[i]);
        } else {
          athletePrs.add(prs[i]);
        }
      }

      Athlete alanDrosky = new Athlete(name: name, events: events, prs: athletePrs, link: link);
      allanDrosky.add(alanDrosky);
    });

    team = new Team(name: teamTitle, type: teamType, teamImage: image, 
      athletes: allanDrosky, isToggled: false, teamUrl: teamUrl, athletesLJ: allanDroskyLJ,
         athletesTJ: allanDroskyTJ
        ,athletesHJ: allanDroskyHJ
        ,athletesWT: allanDroskyWT
        ,athletesHT: allanDroskyHT
        ,athletesST: allanDroskyST
        ,athletesDT: allanDroskyDT
        ,athletesJT: allanDroskyJT
        ,athletesPV: allanDroskyPV
        ,athletes60: allanDrosky60
        ,athletes60H: allanDrosky60H
        ,athletes100: allanDrosky100
        ,athletes100H: allanDrosky100H
        ,athletes110H: allanDrosky110H
        ,athletes200: allanDrosky200
        ,athletes400: allanDrosky400
        ,athletes400H: allanDrosky400H
        ,athletes600: allanDrosky600
        ,athletes800: allanDrosky800
        ,athletes1000: allanDrosky1000
        ,athletes1500: allanDrosky1500
        ,athletesMile: allanDroskyMile
        ,athletes3000: allanDrosky3000
        ,athletes3000S: allanDrosky3000S
        ,athletes5000: allanDrosky5000
        ,athletes10000: allanDrosky10000
        ,athletes5k: allanDrosky5k
        ,athletes6k: allanDrosky6k
        ,athletes8k: allanDrosky8k
        ,athletes10k: allanDrosky10k
    );

    return allanDrosky;
  }
}