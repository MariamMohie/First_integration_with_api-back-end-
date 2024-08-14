import 'package:flutter/material.dart';
import 'package:project_api2/core/theming/colors/color.dart';
import 'package:project_api2/core/theming/size/size.dart';
import 'package:project_api2/core/theming/fonts/fonts.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 300,
      child: Column(
        children: [
          size.height(200),
          ListTile(
            title: Text(
              "Home",
              style: styling.maintitle.copyWith(fontSize: 30),
            ),
            leading:  Icon(Icons.home,color: colors.primary,size: 30,),
          ),
          const SizedBox(height: 40),
        ListTile(
            title: Text(
              "Person",
              style: styling.maintitle.copyWith(fontSize: 30),
            ),
            leading: Icon(
              Icons.person,
              color: colors.primary,
              size: 30,
            ),
          ),
          const SizedBox(height: 40),
            ListTile(
            title: Text(
              "Search",
              style: styling.maintitle.copyWith(fontSize: 30),
            ),
            leading: Icon(
              Icons.search,
              color: colors.primary,
              size: 30,
            ),
          ),
          const SizedBox(height: 40),
              ListTile(
            title: Text(
              "Setting",
              style: styling.maintitle.copyWith(fontSize: 30),
            ),
            leading: Icon(
              Icons.settings,
              color: colors.primary,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
