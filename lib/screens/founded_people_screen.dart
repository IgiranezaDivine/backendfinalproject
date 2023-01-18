import 'package:backendfinalproject/services/getFoundedPeople.dart';
import 'package:flutter/material.dart';
import 'dart:core';

class FoundedPeople extends StatefulWidget {
  const FoundedPeople({super.key});

  @override
  State<FoundedPeople> createState() => _FoundedPeopleState();
}

class _FoundedPeopleState extends State<FoundedPeople> {
  late Future<homeContainer> data;

  @override
  void initState() {
    super.initState();
    data = fetchFoundedPeople();
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: fetchFoundedPeople(),
          builder: (context, snapshot) {
            if (snapshot != null) {
              return Column(
                children: [
                    Container(
                      child: Image(image: NetworkImage(snapshot.data!.photo)),
                    ),
                    Text(snapshot.data!.name),
                    Text(snapshot.data!.names),
                    Text(snapshot.data!.district),
                    Text(snapshot.data!.gender),
                    Text(snapshot.data!.age),
                    Text(snapshot.data!.date),
                    Text(snapshot.data!.name),
                    Text(snapshot.data!.email),
                    Text(snapshot.data!.phone),
                  ],
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
