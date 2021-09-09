// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:untitled2/model/user.dart';

// class Prefs {
//   static saveUser(User user) async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     preferences.setString("user", jsonEncode(user));
//   }

//   static Future loadUser() async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     String? userData = preferences.getString("user");
//     if (userData == null || userData.isEmpty) return null;
//     return User.fromJson(jsonDecode(userData));
//   }

//    static Future<bool> removeUser() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.remove("user");
//   }
// }
