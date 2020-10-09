// To parse this JSON data, do
//
//     final recentGame = recentGameFromJson(jsonString);

import 'dart:convert';

List<RecentGame> recentGameFromJson(String str) => List<RecentGame>.from(json.decode(str).map((x) => RecentGame.fromJson(x)));

String recentGameToJson(List<RecentGame> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RecentGame {
    RecentGame({
        this.tittle,
        this.newResult,
    });

    String tittle;
    String newResult;

    factory RecentGame.fromJson(Map<String, dynamic> json) => RecentGame(
        tittle: json["tittle"],
        newResult: json["New_Result"],
    );

    Map<String, dynamic> toJson() => {
        "tittle": tittle,
        "New_Result": newResult,
    };
}
