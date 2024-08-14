import 'package:flutter/material.dart';
import 'package:project_api2/core/theming/size/size.dart';
import 'package:project_api2/core/theming/fonts/fonts.dart';

class PostData extends StatelessWidget {
  String pathimage_post;
  String content;
  PostData({super.key, required this.pathimage_post, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 400,
          height: 300,
          decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(pathimage_post))),
        ),
        size.height(5),
        Text(
          content,
          style: styling.subtitle.copyWith(color: Colors.black, fontSize: 18),
        ),
      ],
    );
  }
}
