import 'dart:io';

import 'package:backendfinalproject/screens/constant/utils.dart';
import 'package:backendfinalproject/screens/mainPage.dart';
import 'package:backendfinalproject/services/edit_userDetails.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

class RegisterFoundedPeople extends StatefulWidget {
  const RegisterFoundedPeople({super.key});

  @override
  State<RegisterFoundedPeople> createState() => _RegisterFoundedPeopleState();
}

class _RegisterFoundedPeopleState extends State<RegisterFoundedPeople> {
List<File> images = [];

  bool isObscurePassword = true;
  void showAlert() {
    QuickAlert.show(
        context: context,
        title: "Success",
        text: "The person is Updated successful",
        type: QuickAlertType.confirm);
  
  }
    void selectImage() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  } 

  
late Future<Album> _futureAlbum;     
  @override
  void initState() {
    super.initState();
    _futureAlbum = fettchEditUserDetails();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Founded People'),
        backgroundColor: Color.fromARGB(255, 52, 87, 120),
        centerTitle: true,
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
                                'https://media.istockphoto.com/id/670334428/photo/cropped-hand-of-graphic-designer-using-smartphone-and-laptop.jpg?s=612x612&w=is&k=20&c=tNpKj3mmw9nyPXYptLV7hya0fbE1h8ryOr8NHPqESic='))),
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
                              color:  Color.fromARGB(255, 28, 66, 98)),
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
              buildTextField("Username", "Didi", false),
              buildTextField("Gender", "Female", false),
              buildTextField("age", "12", false),
              buildTextField("date", "on Friday 03/01/2022", false),
              
              const SizedBox(
                height: 20,
              ),
              const Text('Submitted By'),
              const SizedBox(
                height: 30,
              ),
              buildTextField("Name", "Uwayo Kevine", false),
              buildTextField("Email", "uwayokevine@gmail.com", false),
              buildTextField("phone", "07863456678", false),
              const SizedBox(
                height: 30,
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
                        setState(() {
                        //    _futureAlbum = updateUser(_controller.text);
                          }
                          );
                          
                    },
                    child: Text("Save",
                        style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 2,
                            color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                        primary:  Color.fromARGB(255, 28, 66, 98),
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
        controller: TextEditingController(),
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
