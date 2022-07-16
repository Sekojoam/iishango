import 'package:flutter/material.dart';
import 'package:iishango/screens/feed_page.dart';
import 'package:iishango/screens/landing.dart';
import 'package:iishango/screens/post.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MaterialApp(
    title: 'iishango',
    //debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    //return PostWidget(tweetItemModel: TweetHelper.getTweet(1));
    return const Landing();
  }
}
