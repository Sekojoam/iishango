import 'package:flutter/material.dart';
import 'package:iishango/screens/connexion.dart';
import 'package:iishango/utils/colors.dart';
import 'package:iishango/utils/styles.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);
  @override
  LandingState createState() => LandingState();
}

class LandingState extends State<Landing> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle landingTextStyle = TextStyle(
      fontSize: 25,
      color: black,
      height: 2,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 150,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/logo.png'),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Container(
              //height: 100,
              margin: const EdgeInsets.only(top: 50, bottom: 50),
              child: Column(children: const <Widget>[
                Text(
                  "Apprenez comme jamais",
                  style: landingTextStyle,
                ),
                Text(
                  "Tout en vous amusant",
                  style: landingTextStyle,
                ),
              ])),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              padding: const EdgeInsets.all(10),
            ),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Connexion()),
                  (Route<dynamic> route) => false);
            },
            child: const Text(
              "Allez !",
              style: buttonTextStyle,
            ),
          )
        ],
      ),
    );
  }
}
