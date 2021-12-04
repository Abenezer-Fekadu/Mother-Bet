import 'package:flutter/material.dart';
import 'package:mother_bet/presentation/mapDisplay/map_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Mother Bet',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        home: MapScreen());
  }
}
