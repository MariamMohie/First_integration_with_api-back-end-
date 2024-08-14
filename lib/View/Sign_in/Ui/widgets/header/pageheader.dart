import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
  PageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.5,
      child: Image.asset(
        'assets/images/SignIn.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}
