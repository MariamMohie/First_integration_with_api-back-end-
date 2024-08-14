import 'package:flutter/material.dart';
import 'package:project_api2/core/theming/colors/color.dart';
import 'package:project_api2/core/theming/size/size.dart';

class contentText extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool suffixIcon;
  final TextEditingController? controller;

  const contentText(
      {Key? key,
      required this.labelText,
      required this.hintText,
      this.suffixIcon = false,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.9,
      child: Column(
        children: [
          size.height(10),
          TextFormField(
            minLines: 2,
            maxLines: 10,
            maxLength: 10,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                    color: colors.primary), // Change this to your desired color
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                    color: Colors
                        .blue), // Change this to your desired color for the focused state
              ),
            ),
            controller: controller,
          ),
        ],
      ),
    );
  }
}
