import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mother_bet/bloc/authBloc/auth_bloc.dart';

import 'package:mother_bet/bloc/foodBloc/foods_bloc.dart';
import 'package:mother_bet/dataProvider/auth_data_provider.dart';
import 'package:mother_bet/dataProvider/foods_data_provider.dart';
import 'package:mother_bet/repository/auth_repository.dart';
import 'package:mother_bet/repository/foods_repository.dart';

import 'package:mother_bet/routes.dart';
import 'package:mother_bet/shared_preferences.dart';

import 'presentation/home/home.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  // await UserSimplePreferences.init();

  runApp(const MyApp());
}

final authRepo = AuthRepository(AuthDataProvider());
final foodsRepo = FoodsRepository(FoodsDataProvider());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  initRoute() {
    // final user = UserSimplePreferences.getUser();
    // if (user != null) {
    // return HomeScreen.routeName;
    // } else {
    return '/';
    // }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => AuthBloc(authRepo)),
        BlocProvider(
            create: (ctx) => FoodsBloc(foodsRepo)..add(const LoadFoods())),
      ],
      child: MaterialApp(
        title: 'Mother Bet',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        initialRoute: initRoute(),
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
