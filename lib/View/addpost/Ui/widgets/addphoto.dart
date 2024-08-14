
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:project_api2/core/theming/colors/color.dart';
import 'package:project_api2/core/theming/fonts/fonts.dart';
class AddPhoto extends StatelessWidget {
  const AddPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
        color: colors.primary,
        strokeWidth: 2,
        dashPattern: const [
          5,
          5,
        ],
        child: SizedBox(
            height: 200,
            width: MediaQuery.sizeOf(context).width * .88,
            child: Padding(
              padding: const EdgeInsets.only(top: 70, left: 45),
              child: ListTile(
                title: Text(
                  "add post Photo",
                  style: styling.subtitle,
                ),
                leading: const Icon(Icons.photo_camera_back_rounded,
                    size: 50, color: colors.primary),
              ),
            )));
  }
}