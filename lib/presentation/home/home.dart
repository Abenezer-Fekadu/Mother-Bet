import 'package:flutter/material.dart';
import 'package:mother_bet/presentation/components/bottom_nav_bar.dart';
import 'package:mother_bet/presentation/home/components/food_list_view.dart';

import 'components/populart_foods.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  final double size = 10;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Discover",
          style: TextStyle(color: Color(0XFF2C2C2C), fontSize: 25),
        ),
        leading: IconButton(
            icon: ClipOval(child: Image.asset('images/menu.png')),
            onPressed: () {
              // scaffoldKey.currentState.openDrawer();
            }),
        actions: [
          IconButton(
              icon: ClipOval(child: Image.asset('images/avatar.png')),
              onPressed: () {}),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: size,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: <Widget>[
                    const PopularFoods(),
                    // Recommended(),
                    Flexible(
                      child: topPickedFoods(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(0),
    );
  }

  Widget topPickedFoods() {
    return Padding(
      padding: const EdgeInsets.only(top: 6.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Text(
            'Top Picked Foods',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 22,
              letterSpacing: 0.27,
              color: Colors.black,
            ),
          ),
          Flexible(
            child: FoodsListView(),
          )
        ],
      ),
    );
  }
}
