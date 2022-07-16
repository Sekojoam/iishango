import 'package:flutter/material.dart';
import 'package:iishango/screens/feed_page.dart';
import 'package:iishango/screens/inscription.dart';
import 'package:iishango/utils/colors.dart';
import 'package:iishango/utils/styles.dart';

class Connexion extends StatefulWidget {
  const Connexion({
    Key? key,
  }) : super(key: key);
  @override
  ConnexionState createState() => ConnexionState();
}

class ConnexionState extends State<Connexion> {
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  bool loading = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: const Color(0xFFFF8000),
          title: const Center(
            child: Text(
              "Connexion",
            ),
          ),
        ),
        body: Builder(
          // Create an inner BuildContext so that the onPressed methods
          // can refer to the Scaffold with Scaffold.of().
          builder: (BuildContext context) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 150),
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                                hintText: "Email",
                                hintStyle: TextStyle(color: black)),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: passController,
                            obscureText: true,
                            decoration: const InputDecoration(
                                hintText: "Mot de passe",
                                hintStyle: TextStyle(color: black)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: primaryColor,
                        padding: const EdgeInsets.all(10),
                      ),
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FeedPage()),
                        );
                      },
                      child: const Text(
                        "Connexion",
                        style: buttonTextStyle,
                      ),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary: black,
                          padding: const EdgeInsets.all(20),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Inscription()),
                          );
                        },
                        child: const Text(
                          "Pas encore inscrit ? Par ici",
                        ),
                      ))
                ],
              ),
            );
          },
        ));
  }
}
