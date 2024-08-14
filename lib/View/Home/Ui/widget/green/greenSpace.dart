import 'package:project_api2/View/Home/Ui/widget/green/button_green.dart';
import 'package:project_api2/core/theming/fonts/fonts.dart';
import 'package:project_api2/core/theming/size/size.dart';
import 'package:flutter/material.dart';

class GreenRectangleWidget extends StatelessWidget {
  const GreenRectangleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: 422,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/Green_rec.png'),
                  fit: BoxFit.cover)),
        ),
        Positioned(
            top: 0,
            bottom: 0,
            child: Image.asset('assets/images/Mask_on_rec.png')),
        Positioned(
            top: 40,
            right: 40,
            child: Column(
              children: [
                Image(image: AssetImage('assets/images/Twits.png')),
                size.height(20),
                Text(
                  'You  have  something  to\n say.We have got people \n who want to hear it !',
                  style: styling.maintitle
                      .copyWith(color: Colors.white, fontSize: 28),
                ),
                size.height(30),
                Button_for_green(),
              ],
            )),
      ],
    );
  }
}
