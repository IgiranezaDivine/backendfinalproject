import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:core';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  fetchPhoto() async {
    var res = await http.get(Uri.parse("http://localhost:6000/api/homeRegister/register"));
    if (res.statusCode == 200) {
      var obj = json.decode(res.body);
      return obj;
    }
  }

  // @override
  // void initState() {
  //   fetchPhoto();
  //   super.initState();
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: fetchPhoto(),
          builder: (context, snapshot) {
            if (snapshot != null) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(snapshot.data[index]['image']),
                    ),
                    title: Text(snapshot.data[index]['names']),
                    subtitle: Text(snapshot.data[index]['place']),
                  );
                },
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
