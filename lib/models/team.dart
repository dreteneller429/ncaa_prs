import 'athlete.dart';

class Team {
  final String name;
  final String type;
  final String teamImage;
  final List<Athlete> athletes;
  bool isToggled;
  final String teamUrl;
  final athletesLJ;
  final athletesTJ;
  final athletesHJ;
  final athletesWT;
  final athletesHT;
  final athletesST;
  final athletesDT;
  final athletesJT;
  final athletesPV;
  final athletes60;
  final athletes60H;
  final athletes100;
  final athletes100H;
  final athletes110H;
  final athletes200;
  final athletes400;
  final athletes400H;
  final athletes600;
  final athletes800;
  final athletes1000;
  final athletes1500;
  final athletesMile;
  final athletes3000;
  final athletes3000S;
  final athletes5000;
  final athletes10000;
  final athletes5k;
  final athletes6k;
  final athletes8k;
  final athletes10k;


  Team({ this.name, this.type, this.teamImage, this.athletes, this.isToggled, this.teamUrl, this.athletesLJ, this.athletesTJ,
  this.athletesHJ,
  this.athletesWT,
  this.athletesHT,
  this.athletesST,
  this.athletesDT,
  this.athletesJT,
  this.athletesPV,
  this.athletes60,
  this.athletes60H,
  this.athletes100,
  this.athletes100H,
  this.athletes110H,
  this.athletes200,
  this.athletes400,
  this.athletes400H,
  this.athletes600,
  this.athletes800,
  this.athletes1000,
  this.athletes1500,
  this.athletesMile,
  this.athletes3000,
  this.athletes3000S,
  this.athletes5000,
  this.athletes10000,
  this.athletes5k,
  this.athletes6k,
  this.athletes8k,
  this.athletes10k});


  int getNumAthletes(event) {
    switch (event) {
      case "Roster":
        {
          return this.athletes.length;
        }
        break;
      case "Long Jump":
        {
          return this.athletesLJ.length;
        }
        break;
      case "Triple Jump":
        {
          return this.athletesTJ.length;
        }
        break;
      case "High Jump":
        {
          return this.athletesHJ.length;
        }
        break;
      case "Weight Throw":
        {
          return this.athletesWT.length;
        }
        break;
      case "Hammer Throw":
        {
          return this.athletesHT.length;
        }
        break;
      case "Shotput":
        {
          return this.athletesST.length;
        }
        break;
      case "Discus":
        {
          return this.athletesDT.length;
        }
        break;
      case "Javelin":
        {
          return this.athletesJT.length;
        }
        break;
      case "Pole Vault":
        {
          return this.athletesPV.length;
        }
        break;
      case "60":
        {
          return this.athletes60.length;
        }
        break;
      case "60 Hurdles":
        {
          return this.athletes60H.length;
        }
        break;
      case "100":
        {
          return this.athletes100.length;
        }
        break;
      case "100 Hurdles":
        {
          return this.athletes100H.length;
        }
        break;
      case "110 Hurdles":
        {
          return this.athletes110H.length;
        }
        break;
      case "200":
        {
          return this.athletes200.length;
        }
        break;
      case "400":
        {
          return this.athletes400.length;
        }
        break;
      case "400 Hurdles":
        {
          return this.athletes400H.length;
        }
        break;
      case "600":
        {
          return this.athletes600.length;
        }
        break;
      case "800":
        {
          return this.athletes800.length;
        }
        break;
      case "1000":
        {
          return this.athletes1000.length;
        }
        break;
      case "1500":
        {
          return this.athletes1500.length;
        }
        break;
      case "Mile":
        {
          return this.athletesMile.length;
        }
        break;
      case "3000":
        {
          return this.athletes3000.length;
        }
        break;
      case "3000 Steeple":
        {
          return this.athletes3000S.length;
        }
        break;
      case "5000":
        {
          return this.athletes5000.length;
        }
        break;
      case "10000":
        {
          return this.athletes10000.length;
        }
        break;
      case "5K (XC)":
        {
          return this.athletes5k.length;
        }
        break;
      case "6K (XC)":
        {
          return this.athletes6k.length;
        }
        break;
      case "8K (XC)":
        {
          return this.athletes8k.length;
        }
      case "10K (XC)":
        {
          return this.athletes10k.length;
        }
        break;
    }
    return 0;
  }

  Athlete getAthlete(event, index) {
    switch (event) {
      case "Roster":
        {
          return this.athletes[index];
        }
        break;

      case "Long Jump":
        {
          return this.athletesLJ[index];
        }
        break;
      case "Triple Jump":
        {
          return this.athletesTJ[index];
        }
        break;
      case "High Jump":
        {
          return this.athletesHJ[index];
        }
        break;
      case "Weight Throw":
        {
          return this.athletesWT[index];
        }
        break;
      case "Hammer Throw":
        {
          return this.athletesHT[index];
        }
        break;
      case "Shotput":
        {
          return this.athletesST[index];
        }
        break;
      case "Discus":
        {
          return this.athletesDT[index];
        }
        break;
      case "Javelin":
        {
          return this.athletesJT[index];
        }
        break;
      case "Pole Vault":
        {
          return this.athletesPV[index];
        }
        break;
      case "60":
        {
          return this.athletes60[index];
        }
        break;
      case "60 Hurdles":
        {
          return this.athletes60H[index];
        }
        break;
      case "100":
        {
          return this.athletes100[index];
        }
        break;
      case "100 Hurdles":
        {
          return this.athletes100H[index];
        }
        break;
      case "110 Hurdles":
        {
          return this.athletes110H[index];
        }
        break;
      case "200":
        {
          return this.athletes200[index];
        }
        break;
      case "400":
        {
          return this.athletes400[index];
        }
        break;
      case "400 Hurdles":
        {
          return this.athletes400H[index];
        }
        break;
      case "600":
        {
          return this.athletes600[index];
        }
        break;
      case "800":
        {
          return this.athletes800[index];
        }
        break;
      case "1000":
        {
          return this.athletes1000[index];
        }
        break;
      case "1500":
        {
          return this.athletes1500[index];
        }
        break;
      case "Mile":
        {
          return this.athletesMile[index];
        }
        break;
      case "3000":
        {
          return this.athletes3000[index];
        }
        break;
      case "3000 Steeple":
        {
          return this.athletes3000S[index];
        }
        break;
      case "5000":
        {
          return this.athletes5000[index];
        }
        break;
      case "10000":
        {
          return this.athletes10000[index];
        }
        break;
      case "5K (XC)":
        {
          return this.athletes5k[index];
        }
        break;
      case "6K (XC)":
        {
          return this.athletes6k[index];
        }
        break;
      case "8K (XC)":
        {
          return this.athletes8k[index];
        }
      case "10K (XC)":
        {
          return this.athletes10k[index];
        }
        break;
    }
    return null;
  }







    }