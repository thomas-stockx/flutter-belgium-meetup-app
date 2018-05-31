import 'package:flutter/material.dart';

import 'package:flutter_live_coding/api/meetup_api.dart';
import 'package:flutter_live_coding/config/styles.dart';

class ProfilePage extends StatelessWidget {
  final MeetupMember member;

  ProfilePage({@required this.member});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: AppColors.actionBar,
      appBar: new AppBar(
        title: new Text(member.name),
        backgroundColor: AppColors.actionBar,
      ),
      body: new Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(colors: <Color>[
            AppColors.profileBackground1,
            AppColors.profileBackground2
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: new Column(
          children: <Widget>[
            new Hero(
              tag: member.userId,
              child: new Container(
                height: 250.0,
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                        fit: BoxFit.cover,
                        image: new NetworkImage(
                            member.photo?.highResUrl ??
                                "http://via.placeholder.com/500x500"))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
