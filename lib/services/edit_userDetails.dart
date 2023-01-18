
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fettchEditUserDetails() async {
  final response = await http.get(
    Uri.parse('http://192.168.0.104:6000/api/userRegister/single'),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<Album> updateUser(String image, String name, String username, String age, String lastSeen, String details, String policeStation, String names, String othername) async {
  final response = await http.put(
    Uri.parse('http://192.168.0.104:6000/api/userRegister/updateUser'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'image': image,
      'name': name,
      'username': username,
      'age':age,
      'lastSeen': lastSeen,
      'details': details,
      'policeStation': policeStation,
      'names': names,
      'othername': othername
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to update User.');
  }
}

class Album {
  final String image;
  final String name;
  final String username;
  final String age;
  final String lastSeen;
  final String details;
  final String policeStation;
  final String names;
  final String othername;

  const Album({required this.image, required this.name,  required this.username, required this.age, required this.lastSeen, required this.details , required this.policeStation, required this.names, required this.othername});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
       image: json['image'],
      name: json['name'],
      username: json['username'],
      age: json['age'],
      lastSeen: json['lastSeen'],
      details: json['details'],
      policeStation: json['policeStation'],
      names: json['names'],
      othername: json['othername'],
    );
  }
}