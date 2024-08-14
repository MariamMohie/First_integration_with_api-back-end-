import 'package:flutter/material.dart';
import 'package:project_api2/core/theming/fonts/fonts.dart';

class PageHeading extends StatelessWidget {
  final String title;
  const PageHeading({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 15,bottom: 15),
      child: Text(
        title,
        style: styling.maintitle
        // const TextStyle(
        //     fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'NotoSerif'),
      ),
    );
  }
}
