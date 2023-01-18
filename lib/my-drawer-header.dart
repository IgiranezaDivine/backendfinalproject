
import 'package:flutter/material.dart';
class MyheaderDrawer extends StatefulWidget {
  const MyheaderDrawer({super.key});

  @override
  State<MyheaderDrawer> createState() => _MyheaderDrawerState();
}

class _MyheaderDrawerState extends State<MyheaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color:  Color.fromARGB(255, 32, 48, 84),
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/logo-Missing2.PNG'),
                )
            ),
          ),
          Text(
            "Missing People",
             style: TextStyle(color: Colors.white, fontSize: 20),
             ),
          Text(
            "nyarugengepolice@gmail.com",
             style: TextStyle(color: Colors.grey[200], fontSize: 14,),
             )
        ],
      ),
    );
  }
}