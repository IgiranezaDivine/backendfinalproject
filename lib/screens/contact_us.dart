import 'package:backendfinalproject/CustomPainter.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContactUs(),
    );
  }
}

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: height * 0.7,
          width: width * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 38, 21, 86),
                Color.fromARGB(255, 21, 73, 116),
              ],
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: CustomPaint(
              size: Size(width, height),
              painter: CardCustomPainter(),
              child: Stack(
                children: [
                  // Positioned(
                  //   bottom: 10,
                  //   left: 50,
                  //   child: Image.asset(
                  //     'assets/images/line4.png',
                  //     width: width * 0.4,
                  //   ),
                  // ),
                  Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Image.asset('assets/images/eye1.jpg',
                            width: width * 0.3, height: height * 0.15),
                      ),
                      Text(
                        'Send Email',
                        style: TextStyle(
                          color: Color.fromARGB(255, 51, 38, 141),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 130,
                      ),
                      detailWidget(
                        icon: Icons.phone,
                        text: '+250789576574',
                      ),
                      detailWidget(
                        icon: Icons.email,
                        text: 'nyarugengepolice@gmail.com',
                      ),
                      detailWidget(
                        icon: Icons.location_on,
                        text: 'Nyarugenge, Nyamirambo',
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget detailWidget({required IconData icon, required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 30,
                color: Colors.white70,
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  text,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                  ),
                ),
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
