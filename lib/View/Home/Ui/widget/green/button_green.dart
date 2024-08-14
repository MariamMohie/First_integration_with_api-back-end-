import 'package:project_api2/core/theming/colors/color.dart';
import 'package:flutter/material.dart';

class Button_for_green extends StatelessWidget {
  const Button_for_green({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white, width: 2.0),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: const Center(
        child: Text(
          'Start your SportBlog',
          style: TextStyle(
            color: colors.primary,
            fontSize: 18.0,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
