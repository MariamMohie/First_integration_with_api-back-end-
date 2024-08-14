import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_api2/core/theming/colors/color.dart';
import 'package:project_api2/core/theming/size/size.dart';

class UploadButtons extends StatelessWidget {
  final void Function()? onPressed_Upload;
  final void Function()? onPressed_Camera;

  const UploadButtons(
      {super.key,
      required this.onPressed_Upload,
      required this.onPressed_Camera});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        children: [
          GestureDetector(
            onTap: onPressed_Upload,
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.8,
              height: 50,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 129, 128, 128).withOpacity(.7),
                borderRadius: BorderRadius.circular(26),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.photo_library_rounded, size: 30,),
                  Text(
                    "   Upload photo",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
          size.height(40),
          GestureDetector(
            onTap: onPressed_Camera,
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.8,
              height: 50,
              decoration: BoxDecoration(
                color: colors.icons.withOpacity(.8),
                borderRadius: BorderRadius.circular(26),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.camera_alt,
                    size: 30,
                  ),
                  Text(
                    "   Take Photo",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
