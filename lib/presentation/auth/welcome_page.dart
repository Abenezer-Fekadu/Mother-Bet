import 'package:flutter/material.dart';
import 'package:mother_bet/presentation/auth/component/roundedBtn.dart';
import 'package:mother_bet/presentation/auth/component/title.dart';
import 'package:mother_bet/presentation/auth/component/top_gradient.dart';
import 'package:mother_bet/presentation/auth/constants.dart';
import 'package:mother_bet/presentation/auth/login_screen.dart';
import 'package:mother_bet/presentation/auth/signup.dart';

class WelcomePage extends StatefulWidget {
  static const String routeName = "/";

  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Widget _submitButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(vertical: 2),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[],
          ),
          child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 2),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                border: Border.all(color: secondaryColor, width: 2),
              ),
              child: const RoundedButton(
                text: "Login",
                color: secondaryColor,
              ))),
    );
  }

  Widget _signUpButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(vertical: 2),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(80)),
            border: Border.all(color: secondaryColor, width: 2),
          ),
          child: const RoundedButton(
            text: "Register",
            color: secondaryColor,
          )),
    );
  }

  Widget _title() {
    return titleName();
  }

  @override
  Widget build(BuildContext context) {
    return wel();
  }

  Widget wel() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: const Offset(2, 4),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              gradient: topGradient()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _title(),
              // Text("$getuser()"),
              const SizedBox(
                height: 30,
              ),
              _submitButton(),
              const SizedBox(
                height: 20,
              ),
              _signUpButton(),
              const SizedBox(
                height: 20,
              ),
              // _label()
            ],
          ),
        ),
      ),
    );
  }
}
