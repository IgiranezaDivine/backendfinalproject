import 'dart:convert';
import 'package:backendfinalproject/pallete.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/widgets/widgets.dart';
import 'package:http/http.dart' as http;
import 'home-screen.dart';

Future<Album> createLogin(String email, String password) async {
  final response = await http.post(
    Uri.parse('http://192.168.137.45:6000/api/auth/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': "*/*",
      'connection': 'keep-alive',
      'Accept-Encoding': 'gzip, deflate, br',
    },
    body: jsonEncode(<String, String>{'email': email, 'password': password}),
  );
  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.

    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception(jsonDecode(response.body));
  }
}

class Album {
  final String email;
  final String password;
  final String? token;

  Album({required this.email, required this.password,this.token});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(email: json['email'], password: json['password']);
  }
}

class LoginScreen extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Future<Album>? _loginAction;
  var loading = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(
          image: 'assets/images/login1.jpg',
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const Flexible(
                child: Center(
                  child: Text(
                    'Missing Person',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 55,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextInputField(
                    icon: FontAwesomeIcons.envelope,
                    hint: 'Email',
                    inputType: TextInputType.emailAddress,
                    inputAction: TextInputAction.next,
                    controller: emailController,
                  ),
                  PasswordInput(
                    icon: FontAwesomeIcons.lock,
                    hint: 'Password',
                    inputType: TextInputType.visiblePassword,
                    inputAction: TextInputAction.done,
                    controller: passwordController,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, 'ForgotPassword'),
                    // ignore: prefer_const_constructors
                    child: Text(
                      'Forget Password',
                      style: kBodyText,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  RoundedButton(
                      buttonName: 'Login',
                      action: () async {
                        setState(() {
                          _loginAction = createLogin(
                              emailController.text, passwordController.text);
                          loading = true;
                        });
                        if (_loginAction != null) {
                          // _loginAction.then((value) =>set value.token);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ));
                        }
                        ;
                      })
                ],
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'CreateNewAccount'),
                child: Container(
                  child: Text(
                    'Create New Account',
                    style: kBodyText,
                  ),
                  decoration: const BoxDecoration(
                      border:
                          Border(bottom: BorderSide(width: 1, color: kWhite))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        )
      ],
    );
  }
}
