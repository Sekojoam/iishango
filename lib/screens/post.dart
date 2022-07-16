import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iishango/screens/feed_page.dart';
import 'package:iishango/utils/colors.dart';
import 'package:money_formatter/money_formatter.dart';

class PostWidget extends StatelessWidget {
  final TweetItemModel tweetItemModel;
  const PostWidget({super.key, required this.tweetItemModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 56),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: DefaultTextStyle(
                              style:
                                  const TextStyle(fontSize: 25.0, color: black),
                              child: AnimatedTextKit(
                                animatedTexts: [
                                  TyperAnimatedText(tweetItemModel.tweet,
                                      textStyle: const TextStyle()),
                                ],
                                onTap: () {
                                  print("Tap Event");
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        const RightItems(
          comments: "10",
          userImg: "data.authorInfos!.covers![0]",
          favorite: 30,
          coverImg: "data.musicInfos!.covers![0]",
        ),
        const LeftItems(
          description: "description",
          musicName: "musicName",
          authorName: "authorName",
          userName: "uniqueId!",
        )
      ],
    ));
  }
}

class LeftItems extends StatefulWidget {
  final String? userName;
  final String? description;
  final String? musicName;
  final String? authorName;

  const LeftItems({
    this.userName,
    this.description,
    this.musicName,
    this.authorName,
  });

  @override
  _LeftItemsState createState() => _LeftItemsState();
}

class _LeftItemsState extends State<LeftItems>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(-2.0, 0.0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        padding: const EdgeInsets.only(left: 8.0),
        width: 280,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              "@${widget.userName}",
              style: const TextStyle(fontSize: 16.0, color: black),
            ),
            const SizedBox(height: 12.0),
            Text(
              "${widget.description}",
              overflow: TextOverflow.clip,
              style: const TextStyle(fontSize: 16.0, color: black),
            ),
            const SizedBox(height: 14.0),
            musicInfo(),
            const SizedBox(height: 12.0),
          ],
        ),
      ),
    );
  }

  Widget musicInfo() {
    return Row(
      children: <Widget>[
        const Icon(FontAwesomeIcons.music, color: black, size: 15.0),
        const SizedBox(width: 5.0),
        SlideTransition(
          position: _offsetAnimation,
          child: Center(
            child: Text(
              "${widget.musicName} - ${widget.authorName}",
              style: const TextStyle(color: black),
            ),
          ),
        ),
      ],
    );
  }
}

class RightItems extends StatelessWidget {
  final int? favorite;
  final String? comments;
  final String? userImg;
  final String? coverImg;

  const RightItems({
    Key? key,
    this.favorite,
    this.comments,
    this.userImg,
    this.coverImg,
  });

  @override
  Widget build(BuildContext context) {
    MoneyFormatter fmf =
        MoneyFormatter(amount: double.parse(favorite.toString()));
    return Align(
      alignment: Alignment.bottomRight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          userLogo(),
          const SizedBox(height: 12.0),
          customIcon(Icons.favorite, "${fmf.output.compactNonSymbol}"),
          customIcon(Icons.insert_comment, comments!),
          customIcon(FontAwesomeIcons.share, "Share"),
          const SizedBox(height: 40.0),
          musicLogo(),
        ],
      ),
    );
  }

  Widget userLogo() {
    return Container(
      height: 25.0,
      width: 25.0,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage('assets/images/logo.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget customIcon(IconData ico, String title) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(ico, color: black, size: 20.0),
        const SizedBox(height: 5.0),
        Text(
          title,
          style: const TextStyle(color: black),
        ),
        const SizedBox(height: 10.0)
      ],
    );
  }

  Widget musicLogo() {
    return Container(
      height: 60.0,
      width: 60.0,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: AvatarGlow(
        glowColor: Colors.black,
        endRadius: 35.0,
        child: Container(
          width: 30.0,
          height: 30.0,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: AssetImage('assets/images/logo.png'), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
