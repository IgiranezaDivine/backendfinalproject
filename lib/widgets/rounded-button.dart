import 'package:flutter/material.dart';
import 'package:backendfinalproject/pallete.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key? key,
    required this.buttonName,
    required this.action,
  }) : super(key: key);

  final String buttonName;
  final VoidCallback action;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(16), color: kBlue),
      child: TextButton(
        onPressed: action,
        child: Text(
          buttonName,
          style: kBodyText.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
