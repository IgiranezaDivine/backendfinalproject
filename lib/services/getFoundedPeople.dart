import 'dart:convert';
import 'dart:io';
import 'package:backendfinalproject/screens/constant/utils.dart';
import 'package:backendfinalproject/services/getHome.dart';
import 'package:http/http.dart' as http;



Future<homeContainer> fetchFoundedPeople() async {
  final result = await http.get(
    (Uri.parse("http://192.168.0.104:6000/api/homeRegister/")),
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
  final String names;
  final String district;
  final String gender;
  final String age;
  final String date;
  final String name;
  final String email;
  final String phone;
  homeContainer(
      {required this.photo,
      required this.names,
      required this.district,
      required this.gender,
      required this.age,
      required this.date,
      required this.name,
      required this.email,
      required this.phone});

  factory homeContainer.fromJson(Map<String, dynamic> json) {
    return homeContainer(
        photo: json['image'],
        name: json['names'],
        district: json['district'],
        gender: json['gender'],
        age: json['age'],
        date: json['date'],
        names: json['names'],
        email: json['email'],
        phone: json['phone']);
  }
}
