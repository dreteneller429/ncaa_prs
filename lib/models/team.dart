import 'athlete.dart';

class Team {
  final String name;
  final String type;
  final String teamImage;
  final List<Athlete> athletes;
  bool isToggled;
  final String teamUrl;

  Team({ this.name, this.type, this.teamImage, this.athletes, this.isToggled, this.teamUrl });

}