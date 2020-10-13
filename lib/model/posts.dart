
// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
    Post({
        this.number,
        this.id,
        this.name,
        this.des,
        this.image,
        this.v,
    });

    String number;
    String id;
    String name;
    String des;
    String image;
    int v;

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        number: json["Number"],
        id: json["_id"],
        name: json["Name"],
        des: json["des"],
        image: json["image"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "Number": number,
        "_id": id,
        "Name": name,
        "des": des,
        "image": image,
        "__v": v,
    };
}
