import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:project_api2/core/theming/colors/color.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final void Function()? onMenuTap;
   final void Function()? onProfileTap;
  final AdvancedDrawerController advancedDrawerController;

  AppBarWidget({
    super.key,
    required this.onMenuTap,
    required this.advancedDrawerController,
    required this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          // Menu Icon Button on the left
          IconButton(
            onPressed: onMenuTap,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: advancedDrawerController,
              builder: (_, value, __) {
                return AnimatedSwitcher(
                  duration: Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                    color: Colors.black,
                  ),
                );
              },
            ),
          ),
          const SizedBox(width: 16), // Space between menu icon and logo
          // Logo
          const Image(
            image: AssetImage('assets/images/black_logo.png'),
            height: 40,
            width: 200,
          ),
          const Spacer(),
          // Profile Picture on the right
          GestureDetector(
           onTap: onProfileTap, 
            child: const CircleAvatar(
              radius: 22,
              backgroundColor: colors.primary,
              backgroundImage: NetworkImage(
                'https://img.freepik.com/free-photo/portrait-handsome-serious-man_23-2149022618.jpg?ga=GA1.1.1454705726.1706974768&semt=ais_hybrid',
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
