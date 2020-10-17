// To parse this JSON data, do
//
//     final vip = vipFromJson(jsonString);

import 'dart:convert';

List<Vip> vipFromJson(String str) => List<Vip>.from(json.decode(str).map((x) => Vip.fromJson(x)));

String vipToJson(List<Vip> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Vip {
    Vip({
        this.phone,
        this.id,
        this.des,
        this.v,
    });

    String phone;
    String id;
    String des;
    int v;

    factory Vip.fromJson(Map<String, dynamic> json) => Vip(
        phone: json["Phone"],
        id: json["_id"],
        des: json["des"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "Phone": phone,
        "_id": id,
        "des": des,
        "__v": v,
    };
}
