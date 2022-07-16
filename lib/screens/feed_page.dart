import 'package:flutter/material.dart';
import 'package:iishango/screens/post.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  FeedPageState createState() => FeedPageState();
}

class FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.black),
        ),
        leading: const Icon(
          Icons.account_circle,
          color: Colors.grey,
          size: 35.0,
        ),
      ),
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, position) {
          TweetItemModel tweet = TweetHelper.getTweet(position);

          return PostWidget(tweetItemModel: tweet);
        },
      ),
    );
  }
}

class TweetItemModel {
  String tweet;
  String username;
  String time;
  String twitterHandle;

  TweetItemModel(this.tweet, this.username, this.time, this.twitterHandle);
}

class TweetHelper {
  static var tweets = [
    TweetItemModel(
        "Ce qu'il y a d'intéressant avec Flutter, c'est la rapidité de développement que l'on obtient pour l'UI.",
        "Sekojoam",
        "3m",
        "@sekojoam"),
    TweetItemModel(
        "Qu'est-ce que vous trouvez à ce framework ? Je ne vois pas la différence avec d'autres qui faisaient pareil.",
        "Josamen",
        "5m",
        "@josamen"),
    TweetItemModel(
        "J'ai pas d'iPhone ohhh, j'aurais aimé commencer le développement dessus avec cette techno",
        "Jojo Le Kodjo",
        "30m",
        "@Kodjo"),
    TweetItemModel(
        "Hey, quelqu'un ici connait flutter ?",
        "Kodjo",
        "3m",
        "@KDJ"),
  ];

  static TweetItemModel getTweet(int position) {
    return tweets[position];
  }
}
