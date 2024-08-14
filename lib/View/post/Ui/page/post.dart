import 'package:flutter/material.dart';
import 'package:project_api2/View/post/Ui/widgets/postheader.dart';
import 'package:project_api2/View/post/Ui/widgets/postdata.dart';
import 'package:project_api2/View/post/Ui/widgets/post_icon.dart';
import 'package:project_api2/core/theming/size/size.dart';
import 'package:project_api2/core/theming/colors/color.dart';

class SinglePost extends StatelessWidget {
  String pathimage_post;
  String content;
  String pathimage_user;
  String username;
  String date;
  String title;

  SinglePost(
      {super.key,
      required this.pathimage_post,
      required this.pathimage_user,
      required this.content,
      required this.username,
      required this.date,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 30, 10, 0),
              //  padding: EdgeInsets.only(left: 10,right: 10,top: 15),
              height: MediaQuery.sizeOf(context).height * .7,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                border: Border.all(color: colors.icons, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 15, bottom: 0),
                    child: PostHeader(
                      pathimage_user: pathimage_user,
                      username: username,
                      date: date,
                    ),
                  ),
                  //size.height(5),
                  PostData(
                    pathimage_post: pathimage_post,
                    content: content,
                  ),

                  size.height(25),
                  PostIcons(),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
