import 'package:flutter/material.dart';
import 'package:project_api2/core/theming/colors/color.dart';

class listView extends StatelessWidget {
  const listView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: colors.primary.withOpacity(.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ]),
          width: MediaQuery.sizeOf(context).width * .8,
          child: ListView.builder(
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5),
                child: CircleAvatar(
                  backgroundImage:
                      AssetImage("assets/images/${itemlogos[index]}"),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

String f_logo = "Boston Celtics (1).png";
String s_logo = "Boston Celtics.png";
String t_logo = "Group.png";

List itemlogos = [f_logo, s_logo, t_logo, f_logo, s_logo, t_logo];
