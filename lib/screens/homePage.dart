
import 'package:backendfinalproject/screens/screens.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var services = [
    "Missing People's HomeScreen ",
    "Register the Person",
    "Update the Person",
    "Register User Details",
    "Edit User Details",
    "Remove the Person",
    "Register founded Person",
    "founded People",
    "Logout"
  ];

  var images = [
    "assets/images/homeScreen.png",
    "assets/images/register.jpg",
    "assets/images/update.jpg",
    "assets/images/userDetails.png",
    "assets/images/editUserDetails.jpg",
    "assets/images/remove.jpg",
    "assets/images/foundedPeople.jpg",
    "assets/images/missingPeople.png",
    "assets/images/logout.jpg",
  ];

  var next = [
   MaterialPageRoute(builder: (context) => const HomeScreen()),
   MaterialPageRoute(builder: (context) => const RegisterHome()),
   MaterialPageRoute(builder: (context) => const EditRegisterHome()),
   MaterialPageRoute(builder: (context) => const FoundedPeople()),
     MaterialPageRoute(builder: (context) => const EditUser()),
      MaterialPageRoute(builder: (context) => const RemovePerson()),
       MaterialPageRoute(builder: (context) => const RegisterFoundedPeople()),
       MaterialPageRoute(builder: (context) =>  const FoundedPeople()),
        MaterialPageRoute(builder: (context) =>  LoginScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      
      padding: EdgeInsets.all(8),
      child: GridView.builder(
          itemCount: services.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.width /
                  MediaQuery.of(context).size.height /
                  0.6),
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 28,
                  ),
                  Image.asset(
                    images[index],
                    height: 50,
                    width: 50,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: TextButton(
                   child: Text   (services[index],
                   
                   style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
                      textAlign: TextAlign.center,
                      ),
                    onPressed: () {
            Navigator.push(context, next[index]);
          },
                      
                    ),

                  )
                  
                ],
              ),
            );
          }),
    );
  }
}
