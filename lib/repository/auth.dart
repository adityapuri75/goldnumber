import 'dart:convert';

import 'package:goldnumber/model/game_data.dart';
import 'package:http/http.dart' as http;

import '../model/game_data.dart';

Future<List<Game>> getData() async {
  var response = await http.get("http://1163743bd1d7.ngrok.io/game");
  return gameFromJson(response.body);
  }
  