import 'package:flutter/material.dart';

class SubscribeButtonWidget extends StatelessWidget {
  SubscribeButtonWidget({super.key, required this.innerText});
  String innerText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Colors.white, width: 2.0),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Center(
        child: Text(
          innerText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
