import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


Future<homeContainer> fetchDataHome() async {
  final result = await http
      .get((Uri.parse("http://192.168.0.104:6000/api/homeRegister/")
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
  final String place;
  homeContainer({required this.photo, required this.name, required this.place});

  factory homeContainer.fromJson(Map<String, dynamic> json) {
    return homeContainer(
        photo: json['image'], name: json['names'], place: json['place']);
  }
}
