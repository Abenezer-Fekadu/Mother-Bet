import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mother_bet/.env.dart';
import 'package:mother_bet/models/mother.dart';
import 'package:mother_bet/outExeption.dart';
import 'package:mother_bet/shared_preferences.dart';

// Get all Foods
class SearchDataProvider {
  Future<List<Mother>> searchFoods(String name) async {
    final user = await UserSimplePreferences.getUser();

    final response = await http.get(Uri.parse("$url/Mothers/$name"), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${user.token}',
    });
    if (response.statusCode == 200) {
      final mothers = jsonDecode(response.body) as List;
      return mothers.map((mother) => Mother.fromJson(mother)).toList();
    } else {
      final err = jsonDecode(response.body);
      throw AppExc(err["msg"]);
    }
  }
}
