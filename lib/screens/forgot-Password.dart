import 'package:backendfinalproject/widgets/background-image.dart';
import '/widgets/background-image.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
          BackgroundImage(image: 'assets/images/login1.jpg')
      ],
    );
  }
}