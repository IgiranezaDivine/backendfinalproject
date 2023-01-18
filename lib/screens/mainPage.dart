import 'dart:ui';

import 'package:backendfinalproject/my-drawer-header.dart';
import 'package:backendfinalproject/my-drawer-list.dart';
import 'package:backendfinalproject/pallete.dart';
import 'package:backendfinalproject/screens/screens.dart';
import 'package:flutter/material.dart';
import 'homePage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 32, 48, 84),
        centerTitle: true,
        title: Text("Missing People"),
        titleTextStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        
      ),
      
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyheaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xFFF0F0F0),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.app_registration_rounded), label: 'Settings'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_balance_outlined), label: 'Account'),
          ]),
      body: getBodyWidget(),
    );
  }

  getBodyWidget() {
    return (_currentIndex == 0) ? HomePage() : ContactUs();
    Container();
  }
}
