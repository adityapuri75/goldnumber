import 'dart:convert';

List<Game> gameFromJson(String str) => List<Game>.from(json.decode(str).map((x) => Game.fromJson(x)));

String gameToJson(List<Game> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Game {
    Game({
        this.tittle,
        this.time,
        this.oldResult,
        this.newResult,
    });

    String tittle;
    String time;
    String oldResult;
    String newResult;

    factory Game.fromJson(Map<String, dynamic> json) => Game(
        tittle: json["tittle"],
        time: json["Time"],
        oldResult: json["Old_Result"],
        newResult: json["New_Result"],
    );

    Map<String, dynamic> toJson() => {
        "tittle": tittle,
        "Time": time,
        "Old_Result": oldResult,
        "New_Result": newResult,
    };
}
