import 'package:flutter/material.dart';
import 'package:project_api2/core/theming/colors/color.dart';
import 'package:project_api2/core/theming/size/size.dart';

class SelectContainerWidget extends StatelessWidget {
  const SelectContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Select NHL Team',
            style: TextStyle(
                color: colors.primary,
                fontSize: 17,
                fontWeight: FontWeight.bold),
          ),
          size.width(10),
          const Icon(
            Icons.keyboard_arrow_down_sharp,
            color: colors.primary,
            size: 30,
          )
        ],
      ),
    );
  }
}
