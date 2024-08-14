import 'package:flutter/material.dart';
import 'package:project_api2/View/post/Ui/page/post.dart';
import 'package:project_api2/View/post/Ui/widgets/post_icon.dart';
import 'package:project_api2/View/post/Ui/widgets/postdata.dart';
import 'package:project_api2/View/post/Ui/widgets/postheader.dart';
import 'package:project_api2/core/theming/colors/color.dart';
import 'package:project_api2/core/theming/size/size.dart';

class DeletePost extends StatelessWidget {
  const DeletePost({super.key});

  @override
  Widget build(BuildContext context) {
    return
      
      
 Scaffold(
  appBar: AppBar(title: Text("Delete Post"), centerTitle: true, actions: [
    GestureDetector(
      onTap: () {
        
      },
      child: Icon(Icons.delete_rounded,color: colors.primary,size: 40,))
  ],),
   body: SingleChildScrollView(
     child: Column(
      
       children: [
        size.height(30),
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
                              pathimage_user: "https://img.freepik.com/free-photo/athlete-playing-sport-with-hand-drawn-doodles_23-2150036347.jpg?ga=GA1.1.1454705726.1706974768&semt=ais_hybrid",
                              username: "Mariam",
                              date: 'Sep.6,2024',
                            ),
                          ),
                          size.height(5),
                          Text("Title"),
                          size.height(5),
                          PostData(
                            pathimage_post: "https://img.freepik.com/free-photo/athlete-playing-sport-with-hand-drawn-doodles_23-2150036347.jpg?ga=GA1.1.1454705726.1706974768&semt=ais_hybrid",
                            content: "Post",
                          ),
         
                          size.height(25),
                          PostIcons(),
                        ],
                      ),
                    ),
                    
       ],
     ),
   ),
 );
    
  
   
  }
}
