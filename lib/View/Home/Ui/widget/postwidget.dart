import 'package:project_api2/core/theming/fonts/fonts.dart';
import 'package:project_api2/core/theming/size/size.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  String pathimage_post;
  String content;
  String pathimage_user;
  String username;
  String date;
  String title;

  PostWidget(
      {super.key,
      required this.pathimage_post,
      required this.pathimage_user,
      required this.content,
      required this.username,
      required this.date,
      required this.title
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          size.height(5),
          Text(
            title,
            style: styling.subtitle.copyWith(color: Colors.black, fontSize: 18),
          ),
          size.height(10),
          Text(
            content,
            style: styling.subtitle.copyWith(color: Colors.black, fontSize: 16),
          ),
           size.height(10),
          Container(
            width: 339,
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(pathimage_post))),
          ),
          
          
          size.height(10),
          Row(
            children: [
              size.width(50),
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(pathimage_user),
              ),
              size.width(5),
              Text(username),
              size.width(10),
              Text(
                date,
                style: TextStyle(color: Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }
}
