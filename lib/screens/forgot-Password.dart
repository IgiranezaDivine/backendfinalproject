import 'package:backendfinalproject/pallete.dart';
import 'package:backendfinalproject/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
   final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        const BackgroundImage(image: 'assets/images/login1.jpg'),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: kWhite,
              ),
            ),
            title: const Text(
              'Forget Password',
            ),
            centerTitle: true,
          ),
          body: Column(children: [
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  Container(
                    width: size.width * 0.8,
                    child: const Text(
                      'Enter your email we will send instruction to reset your password',
                      style: kBodyText,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                   TextInputField(
                    icon: FontAwesomeIcons.envelope,
                    hint: 'Email',
                    inputType: TextInputType.emailAddress,
                    inputAction: TextInputAction.done,
                     controller: emailController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RoundedButton(
                    buttonName: 'Send',
                    action: () => {},
                  )
                ],
              ),
            )
          ]),
        )
      ],
    );
  }
}
