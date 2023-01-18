import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;

Future<HomeContainer> createUserDetails(String image, String name, String username, String age, String lastSeen, String details, String policeStation, String names, String othername) async {
  final result = await http
      .get((Uri.parse("http://localhost:6000/api/userRegister/register")));

  if (result.statusCode == 200) {
    return HomeContainer.fromJson(jsonDecode(result.body));
  } else {
    throw Exception('Failed to Load');
  }
}

class HomeContainer {
  final String photo;
  final String name;
  final String username;
  final String age;
  final String lastSeen;
  final String details;
  final String policeStation;
  final String names;
  final String othername;
  HomeContainer(
      {required this.photo,
      required this.name,
      required this.username,
      required this.age,
      required this.lastSeen,
      required this.details,
      required this.policeStation,
      required this.names,
      required this.othername});

  factory HomeContainer.fromJson(Map<String, dynamic> json) {
    return HomeContainer(
        photo: json['image'],
        name: json['names'],
        username: json['username'],
        age: json['age'],
        lastSeen: json['lastSeen'],
        details: json['details'],
        policeStation: json['policeStation'],
        names: json['names'],
        othername: json['othername']);
  }
}
