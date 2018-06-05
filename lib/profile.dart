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
            new Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: new Column(
                children: <Widget>[
                  new Text(member.name, textAlign: TextAlign.center, style: TextStyles.profileName,),
                  new Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: new Text(member.groupProfile.intro ?? "Unknown", textAlign: TextAlign.center, style: TextStyles.profileDescription,),
                  )
                ],
              ),
            ),
            new Container(
              height: 0.5,
                color: AppColors.semiTransparentLine,
            ),
            new Row(
              children: <Widget>[
                new Expanded(
                  child: new Column(children: <Widget>[
                    new Text("Country", style: TextStyles.profileSmallHeader
                    ),
                    new Text(member.country, style: TextStyles.profileField)
                  ],)
                ),
                new Container(
                  height: 100.0,
                    width: 0.5,
                  color: AppColors.semiTransparentLine,
                ),
                new Expanded(
                    child: new Column(children: <Widget>[
                      new Text("role", style: TextStyles.profileSmallHeader
                      ),
                      new Text(member.groupProfile?.role ?? "member", style: TextStyles.profileField)
                    ],)
                ),
              ],
            ),new Container(
              height: 0.5,
              color: AppColors.semiTransparentLine,
            ),
          ],
        ),
      ),
      bottomNavigationBar: new Container(
        padding: new EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        decoration: new BoxDecoration(
          gradient: new LinearGradient(colors: [AppColors.navBarBackground1, AppColors.navBarBackground2], begin: Alignment.topLeft, end: Alignment.bottomRight)
        ),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new IconButton(
              icon: new Image(
                width: 22.0,
                  height: 22.0,
                  image: new AssetImage("assets/images/calendar.png"),
              ), onPressed: () {},
            ),
            new Padding(
              padding: const EdgeInsets.all(8.0),
              child: new FloatingActionButton(
                backgroundColor: Colors.white,
                child: const Icon(
                  Icons.add,
                  color: AppColors.navBarBackground1,
                ), onPressed: () {},
              ),
            ),
            new IconButton(
                icon: new Image(
                  width: 20.0,
                  height: 20.0,
                  image: new AssetImage("assets/images/overview.png"),
                ), onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
