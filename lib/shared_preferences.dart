import 'dart:convert';

import 'package:mother_bet/models/user.dart';
import 'package:mother_bet/outExeption.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  // static SharedPreferences preferences;

  static const _keyUser = "user";

  // static Future init() async {
  //   final SharedPreferences preferences = await _prefs;
  // }

  static Future setUser(User user) async {
    try {
      final SharedPreferences preferences = await prefs;

      await preferences.setString(_keyUser, json.encode(user));
    } catch (e) {
      throw AppExc("User Couldn't Be Set");
    }
  }

  static Future<User> getUser() async {
    try {
      final SharedPreferences preferences = await prefs;

      return User.fromJson(json.decode(preferences.getString(_keyUser)!));
    } catch (err) {
      throw AppExc("User Doesn't Exist");
    }
  }
}