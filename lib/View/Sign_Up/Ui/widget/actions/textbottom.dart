import 'package:flutter/material.dart';
import 'package:project_api2/core/theming/colors/color.dart';

class textbottom extends StatelessWidget {
  String text;
  String buttonname;
  final void Function()? onPressed;

  textbottom({super.key, required this.onPressed, required this.text,
  required this.buttonname});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
                fontSize: 15,
                color: Color(0xff939393),
                fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap:  onPressed,
            child: Container(
              child: Text(
                buttonname,
                style: TextStyle(
                    fontSize: 18,
                    color: colors.primary,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
