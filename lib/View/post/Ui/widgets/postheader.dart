import 'package:flutter/material.dart';
import 'package:project_api2/core/theming/size/size.dart';
class PostHeader extends StatelessWidget {
    String pathimage_user;
  String username;
  String date;
   PostHeader({super.key, required this.pathimage_user, required this.username , required this.date});

  @override
  Widget build(BuildContext context) {
    return   Row(
                    children: [
                      size.width(5),
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(pathimage_user),
                      ),
                      size.width(10),
                      Text(username),
                      size.width(35),
                      Text(
                        date,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  );
  }
}