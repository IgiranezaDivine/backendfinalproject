import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> createHome(String photo, String name, String place) async {
  final response = await http.post(
    Uri.parse('http://192.168.0.104:6000/api/homeRegister/register'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'image': photo,
      'name': name,
      'district': place,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

class Album {
  final String photo;
  final String name;
  final String place;

  const Album({required this.photo, required this.name, required this.place});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      photo: json['image'],
      name: json['name'],
      place: json['place'],
    );
  }
}