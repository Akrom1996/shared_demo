import 'package:flutter/material.dart';

// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        this.userName,
        this.password,
    });

    String? userName;
    String? password;

    factory User.fromJson(Map<String, dynamic> json) => User(
        userName: json["userName"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "userName": userName,
        "password": password,
    };
}
