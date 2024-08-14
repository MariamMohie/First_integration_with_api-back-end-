import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_api2/core/theming/size/size.dart';
import 'package:project_api2/core/theming/fonts/fonts.dart';
import 'package:project_api2/core/theming/colors/color.dart';

class PostIcons extends StatefulWidget {
  const PostIcons({super.key});

  @override
  State<PostIcons> createState() => _PostIconsState();
}

class _PostIconsState extends State<PostIcons> {
  bool like = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.spaceEvenly, // Evenly distribute the icons
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              like = !like;
            });
          },
          child: Column(
            children: [
              Icon(
              like?  Icons.thumb_up_alt
                    :Icons.thumb_up_alt_outlined, // Like icon
                color: colors.primary,
                size: 30,
              ),
              SizedBox(height: 4), // Space between icon and text
              Text(
                "Like",
                style: styling.maintitle
                    .copyWith(fontSize: 14), // Adjusted font size
              ),
            ],
          ),
        ),
        size.width(15),
        Column(
          children: [
            Icon(
              Icons.comment_outlined, // Comment icon
              color: colors.primary,
              size: 30,
            ),
            SizedBox(height: 4), // Space between icon and text
            Text(
              "Comment",
              style: styling.maintitle
                  .copyWith(fontSize: 14), // Adjusted font size
            ),
          ],
        ),
        size.width(15),
        Column(
          children: [
            Icon(
              Icons.share_outlined, // Share icon
              color: colors.primary,
              size: 30,
            ),
            SizedBox(height: 4), // Space between icon and text
            Text(
              "Share",
              style: styling.maintitle
                  .copyWith(fontSize: 14), // Adjusted font size
            ),
          ],
        ),
      ],
    );
  }
}
