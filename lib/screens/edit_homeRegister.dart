import 'dart:io';

import 'package:backendfinalproject/screens/constant/utils.dart';
import 'package:backendfinalproject/screens/mainPage.dart';
//import 'package:backendfinalproject/services/register_user.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

class EditRegisterHome extends StatefulWidget {
  const EditRegisterHome({super.key});

  @override
  State<EditRegisterHome> createState() => _EditRegisterHomeState();
}

class _EditRegisterHomeState extends State<EditRegisterHome> {
List<File> images = [];

  bool isObscurePassword = true;
  void showAlert() {
    QuickAlert.show(
        context: context,
        title: "Success",
        text: "The person is Successful Registered",
        type: QuickAlertType.success);
  }

    void selectImage() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Home Registration'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 52, 87, 120),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(
              context,
              MainPage(),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1))
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://media.istockphoto.com/id/1446693246/photo/businessman-using-smartphone-to-input-alphabet-in-searching-bar-for-search-engine.jpg?s=612x612&w=is&k=20&c=_AEW6T12l86YnsuokVVSZGwq9AfUPt60FeSCFCxyCkY='))),
                  ),
                 GestureDetector(
                    onTap: selectImage,
                    child: Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 4, color: Colors.white),
                              color: Color.fromARGB(255, 28, 66, 98)),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                  )
                ]),
              ),
              const SizedBox(
                height: 20,
              ),
              buildTextField("Names", "Igiraneza Divine", false),
              buildTextField("District", "Nyarugenge", false),
           
              const SizedBox(
                height: 20,
              ),
            
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: Text("Cancel",
                        style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 2,
                            color: Colors.black)),
                    style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                  ElevatedButton(
                    onPressed: () {
           
                    },
                    child: Text("Edit",
                        style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 2,
                            color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 27, 64, 94),
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextField(
        obscureText: isPasswordTextField ? isObscurePassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    icon: Icon(Icons.remove_red_eye, color: Colors.grey),
                    onPressed: () {})
                : null,
            contentPadding: EdgeInsets.only(bottom: 5),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
      ),
    );
  }
}