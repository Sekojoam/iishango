import 'package:flutter/material.dart';
import 'package:iishango/screens/feed_page.dart';
import 'package:iishango/utils/colors.dart';
import 'package:iishango/utils/styles.dart';

class Inscription extends StatefulWidget {
  const Inscription({
    Key? key,
  }) : super(key: key);
  @override
  _InscriptionState createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  final pseudoController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final dateController = TextEditingController();
  bool loading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFFF8000),
          title: const Center(
            child: Text(
              "Inscription",
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  TextField(
                    controller: pseudoController,
                    decoration: const InputDecoration(
                        hintText: "Pseudo", hintStyle: TextStyle(color: black)),
                  ),
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        hintText: "Email", hintStyle: TextStyle(color: black)),
                  ),
                  TextField(
                    controller: passController,
                    obscureText: true,
                    decoration: const InputDecoration(
                        hintText: "Mot de passe",
                        hintStyle: TextStyle(color: black)),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text(
                  "En cliquant sur inscription vous déclarez accepter toutes les conditions d'utilisation",
                  style: TextStyle(
                    color: black,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: const EdgeInsets.all(10),
                  ),
                  child: const Text(
                    "Inscription",
                    style: buttonTextStyle,
                  ),
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FeedPage()),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
