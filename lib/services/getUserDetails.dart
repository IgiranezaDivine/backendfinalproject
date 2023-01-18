import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


Future<homeContainer> fetchUserDetails() async {
  final result = await http
      .get((Uri.parse("http://192.168.0.104:6000/api/userRegister/single")
      ),
       headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': "*/*",
      'connection': 'keep-alive',
      'Accept-Encoding': 'gzip, deflate, br',
    },
    
    );

  if (result.statusCode == 200) {
    return homeContainer.fromJson(jsonDecode(result.body));
  } else {
    throw Exception('Failed to Load');
  }
}

class homeContainer {
   final String photo;
  final String name;
  final String username;
  final String age;
  final String lastSeen;
  final String details;
  final String policeStation;
  final String names;
  final String othername;
  homeContainer({required this.photo, required this.name, required this.username, required this.age, required this.lastSeen,
   required this.details, required this.policeStation, required this.names, required this.othername});

  factory homeContainer.fromJson(Map<String, dynamic> json) {
    return homeContainer(
       photo: json['image'], name: json['names'], username: json['username'], age: json['age'], lastSeen: json['lastSeen'], details: json['details']
        ,policeStation: json['policeStation'], names: json['names'], othername: json['othername']);
  }
}
