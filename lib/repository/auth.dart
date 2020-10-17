import 'dart:convert';

import 'package:goldnumber/model/chart.dart';
import 'package:goldnumber/model/game_data.dart';
import 'package:goldnumber/model/posts.dart';
import 'package:goldnumber/model/recent_game.dart';
import 'package:goldnumber/model/vip.dart';
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

Future<List<Post>> getPost() async {
  var response = await http.get("https://goldnumber.herokuapp.com/guess");
  return postFromJson(response.body);
}

Future newPost(String name, String number, String des, String image) async {
  var response = await http.post("https://goldnumber.herokuapp.com/guess",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "Name": name,
        "Number": number,
        "des": des,
        "image": image
      }));
  print(response.body);
  return response.body;
}

Future deletePost(String id) async {
  var response = await http.delete(
    "https://goldnumber.herokuapp.com/guess/" + id,
  );

  print(response.body);

  return response.body;
}

Future vipPost(String phone, String des) async {
  var response = await http.post("https://goldnumber.herokuapp.com/vip",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "Phone": phone,
        "des": des,
      }));
  print(response.body);
  return response.body;
}


Future<List<Vip>> getVipPost() async {
  var response = await http.get("https://goldnumber.herokuapp.com/vip");
  return vipFromJson(response.body);
}


Future vipDeletePost(String id) async {
  var response = await http.delete(
    "https://goldnumber.herokuapp.com/vip/" + id,
  );

  print(response.body);

  return response.body;
}
