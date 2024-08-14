import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_api2/View/Sign_Up/cubit/cubit/signup_cubit.dart';
import 'package:project_api2/core/theming/colors/color.dart';

class PickImageWidget extends StatelessWidget {

  PickImageWidget({
    super.key,
    required this.onclick
  }); 
  final void Function()? onclick ;
  @override
  Widget build(BuildContext context) {
  
     
        return SizedBox(
          width: 130,
          height: 130,
          child:  CircleAvatar(
            
                  backgroundColor: colors.primary,
                  backgroundImage: AssetImage("assets/images/avatar.png"),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 5,
                        right: 5,
                        child: GestureDetector(
                          onTap:onclick,
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: colors.primary,
                              border: Border.all(color: Colors.white, width: 3),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: const Icon(
                              Icons.camera_alt_sharp,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              // : CircleAvatar(
              //     backgroundImage: FileImage(File(cubit.profilePic!.path)),
              //   ),
        );
      
  
  }
}
