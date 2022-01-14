import 'package:flutter/material.dart';
import 'package:mother_bet/presentation/auth/login_screen.dart';
import 'package:mother_bet/presentation/auth/signup.dart';
import 'package:mother_bet/presentation/auth/welcome_page.dart';
import 'package:mother_bet/presentation/home/home.dart';
import 'package:mother_bet/presentation/mapDisplay/map_view.dart';

class Routes {
  static Route generateRoute(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(builder: (context) => const WelcomePage());
    }

// Auth
    if (settings.name == LoginPage.routeName) {
      return MaterialPageRoute(builder: (context) => LoginPage());
    }

    if (settings.name == SignUpPage.routeName) {
      return MaterialPageRoute(builder: (context) => SignUpPage());
    }

    // Bottom Navigation
    if (settings.name == HomeScreen.routeName) {
      return MaterialPageRoute(builder: (context) => HomeScreen());
    }
    if (settings.name == MapScreen.routeName) {
      return MaterialPageRoute(builder: (context) => const MapScreen());
    }

    // Tour
    // if (settings.name == TourInfoScreen.routeName) {
    //   Tour tour = settings.arguments as Tour;
    //   return MaterialPageRoute(builder: (context) => TourInfoScreen(tour));
    // }

    // if (settings.name == AgentHome.routeName) {
    //   return MaterialPageRoute(builder: (context) => AgentHome());
    // }
    // if (settings.name == TourAdd.routeName) {
    //   TourArgument args = settings.arguments as TourArgument;

    //   return MaterialPageRoute(builder: (context) => TourAdd(args));
    // }
    return MaterialPageRoute(builder: (context) => const WelcomePage());
  }
}

// class TourArgument {
//   final Tour tour;
//   final bool edit;
//   TourArgument({this.tour, @required this.edit});
// }
