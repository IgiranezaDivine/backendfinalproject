import 'package:backendfinalproject/screens/login-screen.dart';
import 'package:flutter/material.dart';

class SendEmail extends StatefulWidget {
  const SendEmail({super.key});

  @override
  State<SendEmail> createState() => _SendEmailState();
}

class _SendEmailState extends State<SendEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            MaterialPageRoute(builder: (context) =>  LoginScreen());
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "Send Email",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Send email message to this email policenyarugenge@gmail.com",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                buildTextField("Names", "Uwayo Kevine", false),
                const SizedBox(
                  height: 10,
                ),
                buildTextField("Email", "uwayokevine2@gmail.com", false),
                const SizedBox(
                  height: 10,
                ),
                buildTextField(
                    "Message",
                    "i found the person who called ..... she is 12 years",
                    false),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    padding: EdgeInsets.only(top: 30, left: 3),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor:
                                    Color.fromARGB(255, 130, 179, 219),
                                title: Text('Comfirmation'),
                                content:
                                    Text('Are you sure you want send message'),
                                actions: [
                                  MaterialButton(
                                    onPressed: () {},
                                    child: Text('Yes'),
                                  ),
                                  MaterialButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('No'),
                                  ),
                                ],
                              );
                            });
                      },
                      color: Color.fromARGB(255, 90, 139, 179),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        "Send",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder, bool bool) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextField(
        decoration: InputDecoration(
          labelStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 124, 123, 123)),
          contentPadding: EdgeInsets.only(bottom: 5),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 13,
            color: Color.fromARGB(255, 159, 158, 158),
          ),
        ),
      ),
    );
  }
}
