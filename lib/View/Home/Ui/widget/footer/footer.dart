import 'package:project_api2/core/theming/colors/color.dart';
import 'package:project_api2/core/theming/size/size.dart';
import 'package:project_api2/core/theming/fonts/fonts.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: 659,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/fotter_rec.png'),
                  opacity: .4,
                  fit: BoxFit.cover)),
        ),
        Positioned(
            top: 70,
            right: 30,
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: 330,
                      height: 50,
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Your email',
                            filled: true,
                            fillColor: colors.background,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(width: 0))),
                      ),
                    ),
                    Positioned(
                        right: 0,
                        child: Container(
                          width: 130,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: colors.primary),
                          child: Center(
                            child: Text(
                              'Send',
                              style: styling.subtitle
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ))
                  ],
                ),
                size.height(30),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'ABOUT',
                      style: styling.maintitle.copyWith(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                    )),
                size.height(13),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'CONTACT US',
                      style: styling.maintitle.copyWith(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                    )),
                size.height(13),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'HELP',
                      style: styling.maintitle.copyWith(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                    )),
                size.height(13),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'LEGAL',
                      style: styling.maintitle.copyWith(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                    )),
                size.height(13),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'STORE',
                      style: styling.maintitle.copyWith(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                    )),
                size.height(30),
                Image(image: AssetImage('assets/images/social icons.png')),
                size.height(30),
                Image(image: AssetImage('assets/images/Copy_rights.png')),
              ],
            )),
      ],
    );
  }
}
