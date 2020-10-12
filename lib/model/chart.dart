// To parse this JSON data, do
//
//     final gameChart = gameChartFromJson(jsonString);

import 'dart:convert';

GameChart gameChartFromJson(String str) => GameChart.fromJson(json.decode(str));

String gameChartToJson(GameChart data) => json.encode(data.toJson());

class GameChart {
    GameChart({
        this.data,
        this.message,
        this.code,
    });

    List<Datum> data;
    String message;
    int code;

    factory GameChart.fromJson(Map<String, dynamic> json) => GameChart(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
        code: json["Code"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "Code": code,
    };
}

class Datum {
    Datum({
        this.bazarName,
        this.resultDate,
        this.result,
        this.time,
    });

    String bazarName;
    String resultDate;
    String result;
    String time;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        bazarName: json["bazar_name"],
        resultDate: json["result_date"],
        result: json["result"],
        time: json["time"],
    );

    Map<String, dynamic> toJson() => {
        "bazar_name": bazarName,
        "result_date": resultDate,
        "result": result,
        "time": time,
    };
}
