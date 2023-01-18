import 'package:backendfinalproject/services/getHome.dart';
import 'package:flutter/material.dart';
import 'dart:core';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<homeContainer> data;

  @override
  void initState() {
    super.initState();
    data = fetchDataHome();
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: fetchDataHome(),
          builder: (context, snapshot) {
            if (snapshot == null) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(snapshot.data!.photo),
                    ),
                    title: Text(snapshot.data!.name),
                    subtitle: Text(snapshot.data!.place),
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
