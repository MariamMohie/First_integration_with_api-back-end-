
import 'package:flutter/material.dart';

class PostButton extends StatelessWidget {
  final String innerText;
  final void Function()? onPressed;
  Color buttoncolor;
  PostButton({
    Key? key,
    required this.innerText,
    required this.onPressed,
    required this.buttoncolor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: buttoncolor,
        borderRadius: BorderRadius.circular(26),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          innerText,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
