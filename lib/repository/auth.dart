import 'dart:convert';

import 'package:goldnumber/model/chart.dart';
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

Future<GameChart> getChartData(String game) async {
  var response = await http.post(
    "http://playsatta.co/index.php/api/result-history",
    headers: <String, String>{
      "Accept": "application/json",
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    encoding: Encoding.getByName("utf-8"),
    body: "bazar_name=$game&bazar_type=King Bazar",
  );
    
    print(response.body);
    return gameChartFromJson(response.body);
 
}
