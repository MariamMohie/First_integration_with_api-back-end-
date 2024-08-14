import 'package:flutter/material.dart';
import 'package:project_api2/core/routing/router.dart';
import 'package:project_api2/core/theming/size/size.dart';

class PageHead extends StatelessWidget {
  final String title;
  const PageHead({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: Row(children: [
        IconButton(
            onPressed: () {
              context.goBack();
            },
            icon: Icon(Icons.arrow_back)),
        size.width(90),
        Text(
          title,
          style: const TextStyle(
              //color: colors.icons,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontFamily: 'NotoSerif'),
        ),
      ]),
    );
  }
}
