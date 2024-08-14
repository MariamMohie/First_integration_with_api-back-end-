import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_api2/View/profile/cubit/cubit/profile_cubit.dart';
import 'package:project_api2/core/theming/colors/color.dart';

class PickProfileImageWidget extends StatelessWidget {
  final ProfileCubit cubit;

  PickProfileImageWidget({
    super.key,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      bloc: cubit,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Circle Avatar
            SizedBox(
              width: 130,
              height: 130,
              child: CircleAvatar(
                backgroundColor: colors.primary,
                backgroundImage: cubit.profilePic != null
                    ? FileImage(File(cubit.profilePic!.path))
                    : const AssetImage("assets/images/avatar.png") as ImageProvider,
              ),
            ),
            const SizedBox(width: 20), // Space between the avatar and button

            // Styled Button to change avatar
            ElevatedButton(
              onPressed: () async {
                final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  cubit.uploadProfilePic(pickedFile);
                }
              },
              style: ElevatedButton.styleFrom(
              //  primary: Colors.transparent, // Transparent background
              //  onPrimary: Colors.green,      // Text color
                side: BorderSide(color: Colors.grey), // Border color
                elevation: 0, // Remove shadow/elevation
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Rounded corners (optional)
                ),
              ),
              child: const Text("Change Avatar"),
            ),
          ],
        );
      },
    );
  }
}