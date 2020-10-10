import 'package:goldnumber/model/game_data.dart';
import 'package:goldnumber/model/recent_game.dart';
import 'package:http/http.dart' as http;

import '../model/game_data.dart';

Future<List<Game>> getData() async {
  var response = await http.get("https://goldnumber.herokuapp.com/game");
  return gameFromJson(response.body);
  }
  

  Future<List<RecentGame>> getRecentData() async {
  var response = await http.get("https://goldnumber.herokuapp.com/game/recent");
  return recentGameFromJson(response.body);
  }