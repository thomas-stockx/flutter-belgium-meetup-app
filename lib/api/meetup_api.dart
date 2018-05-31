import 'dart:async';
import 'dart:convert';

import 'package:flutter_live_coding/config/config.dart';
import 'package:http/http.dart';

class MeetupApi {
  static Future<List<MeetupMember>> getMembersForGroup(String group) async {
    String getMembersEndpoint =
        'https://api.meetup.com/' + group + '/members' + Config.MeetupApiKey;
    Response response = await get(getMembersEndpoint);

    print(response.body);
    List responseJson = json.decode(response.body);

    return responseJson
        .map<MeetupMember>(
            (dynamic member) => new MeetupMember.fromJson(member))
        .toList();
  }
}

class MeetupMember {
  final int userId;
  final String name;
  final String country;
  final MeetupPhoto photo;
  final MeetupGroupProfile groupProfile;

  MeetupMember(
      {this.userId, this.name, this.photo, this.country, this.groupProfile});

  factory MeetupMember.fromJson(Map<String, dynamic> json) {
    return new MeetupMember(
      userId: json['id'],
      name: json['name'],
      country: json['localized_country_name'],
      photo: json['photo'] != null
          ? new MeetupPhoto.fromJson(json['photo'])
          : null,
      groupProfile: json['group_profile'] != null
          ? new MeetupGroupProfile.fromJson(json['group_profile'])
          : null,
    );
  }
}

class MeetupPhoto {
  final String photoUrl;
  final String thumbUrl;
  final String highResUrl;

  MeetupPhoto({this.photoUrl, this.thumbUrl, this.highResUrl});

  factory MeetupPhoto.fromJson(Map<String, dynamic> json) {
    return new MeetupPhoto(
      photoUrl: json['photo_link'],
      thumbUrl: json['thumb_link'],
      highResUrl: json['highres_link'],
    );
  }
}

class MeetupGroupProfile {
  final String intro;
  final String role;

  MeetupGroupProfile({this.intro, this.role});

  factory MeetupGroupProfile.fromJson(Map<String, dynamic> json) {
    return new MeetupGroupProfile(
      intro: json['intro'],
      role: json['role'],
    );
  }
}
