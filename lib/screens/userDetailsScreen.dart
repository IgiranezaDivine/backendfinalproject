import 'package:backendfinalproject/services/getUserDetails.dart';
import 'package:backendfinalproject/services/registerUseDetails.dart';
import 'package:flutter/material.dart';
import 'dart:core';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
   late Future<homeContainer> data;

  @override
  void initState() {
    super.initState();
    data = fetchUserDetails();
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
            future: fetchUserDetails(),
            builder: (context, snapshot) {
              if (snapshot != null) {
                return Column(
                  children: [
                    Container(
                      child: Image(image: NetworkImage(snapshot.data!.photo)),
                    ),
                    Text(snapshot.data!.name),
                    Text(snapshot.data!.username),
                    Text(snapshot.data!.age),
                    Text(snapshot.data!.lastSeen),
                    Text(snapshot.data!.details),
                    Text(snapshot.data!.policeStation),
                    Text(snapshot.data!.names),
                    Text(snapshot.data!.othername),
                  ],
                );
              } else {
                return const CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}
