import 'package:flutter/material.dart';
import 'package:project_api2/core/theming/colors/color.dart';

class SaveChangesButton extends StatefulWidget {
  const SaveChangesButton({super.key});

  @override
  State<SaveChangesButton> createState() => _SaveChangesButtonState();
}

class _SaveChangesButtonState extends State<SaveChangesButton> {
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){},
      child: Container(
                                width: 150,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: colors.primary,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: const Center(
                                  child: Text(
                                    'save',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
    );
  }
}