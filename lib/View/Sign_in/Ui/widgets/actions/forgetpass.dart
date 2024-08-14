import 'package:flutter/material.dart';

class ForgetPasswordWidget extends StatelessWidget {
  const ForgetPasswordWidget({
    super.key,

  });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.80,
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () => {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => const ForgetPasswordPage(),
          //   ),
          // )
        },
        child: const Text(
          'Forget password?',
          style: TextStyle(
            color: Color(0xff939393),
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
