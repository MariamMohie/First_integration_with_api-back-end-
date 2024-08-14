import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_api2/View/Home/Ui/widget/drowers/drower2.dart';
import 'package:project_api2/View/Sign_Up/cubit/cubit/signup_cubit.dart';
import 'package:project_api2/View/profile/Ui/page/inner_page.dart/UserPost/User_posts.dart';
import 'package:project_api2/View/profile/Ui/widgets/Save_changes.dart';
import 'package:project_api2/View/profile/Ui/widgets/profile.dart';
import 'package:project_api2/View/profile/cubit/cubit/profile_cubit.dart';
import 'package:project_api2/core/api/dio_consumer.dart';
import 'package:project_api2/core/api/endPointes.dart';
import 'package:project_api2/core/routing/router.dart';
import 'package:project_api2/core/theming/colors/color.dart';
import 'package:project_api2/core/theming/fonts/fonts.dart';
import 'package:project_api2/core/theming/size/size.dart';
import 'package:project_api2/repositories/auth_repository.dart';
import 'package:project_api2/repositories/user_repository.dart';

class ProfileScreen_res extends StatefulWidget {
  ProfileScreen_res({super.key});

  @override
  State<ProfileScreen_res> createState() => _ProfileScreen_resState();
}

class _ProfileScreen_resState extends State<ProfileScreen_res> {
  bool isProfileSelected = true; // This state tracks the selected tab

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfileCubit(userRepo(api: DioConsumer(dio: Dio())))..getdataChach(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is GetUserFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errMessage),
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<ProfileCubit>(context);
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: state is GetUserLoading
                  ? CircularProgressIndicator()
                  : state is GetuserSuccess
                      ?
            Column(
              children: [
                size.height(60),
                Text(
                  'Account Settings',
                  style: styling.subtitle.copyWith(fontSize: 20),
                ),
                size.height(20),
                // The tab buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isProfileSelected = true; // Switch to profile
                        });
                      },
                      child: Column(
                        children: [
                          Text(
                            'My Profile',
                            style: styling.maintitle.copyWith(
                              fontSize: 20,
                              color: isProfileSelected
                                  ? colors.primary
                                  : Colors.black,
                            ),
                          ),
                          if (isProfileSelected)
                            Container(
                              width: 120,
                              height: 3,
                              color: colors.primary,
                            ),
                        ],
                      ),
                    ),
                    size.width(30),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isProfileSelected = false;
                           // Switch to posts
                        });
                      },
                      child: Column(
                        children: [
                          Text(
                            'Posts',
                            style: styling.maintitle.copyWith(
                              fontSize: 20,
                              color: !isProfileSelected
                                  ? colors.primary
                                  : Colors.black,
                            ),
                          ),
                          if (!isProfileSelected)
                            Container(
                              width: 120,
                              height: 3,
                              color: colors.primary,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
                size.height(30),
                // Conditional rendering of the content
                if (isProfileSelected)
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              size.width(30),
                              PickProfileImageWidget(
                                cubit: ProfileCubit(
                                    userRepo(api: DioConsumer(dio: Dio()))),
                              ),
                            ],
                          ),
                          size.height(50),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Bio',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 8),
                                TextField(
                                  controller: cubit.user_bio_controller,
                                  maxLines: 5, // Allows multiple lines of input
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    label: Text(
                                      state.data[ApiKey.bio].toString(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 350,
                            child: TextField(
                              controller: cubit.user_name_controller,
                              decoration: InputDecoration(
                                  hintText: 'User Name',
                                  label: Text(
                                      state.data[ApiKey.name].toString()),
                                  filled: true,
                                  fillColor: colors.background,
                                  prefixIcon: Icon(Icons.person),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: colors.sub_background,
                                          width: 0))),
                            ),
                          ),
                          size.height(30),
                          Container(
                            width: 350,
                            child: TextField(
                              controller: cubit.user_email_cntroller,
                              decoration: InputDecoration(
                                  hintText: 'Email',
                                  label: Text(
                                      state.data[ApiKey.email].toString()),
                                  filled: true,
                                  fillColor: colors.background,
                                  prefixIcon: Icon(Icons.email),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: colors.sub_background,
                                          width: 0))),
                            ),
                          ),
                          size.height(30),
                          SaveChangesButton(),
                        ],
                      ),
                    ),
                  )
                else
                  Expanded(
                    child: UserPosts(), // This shows the posts when 'Posts' is selected
                  ),
              ],
            ):Container()
          );
        },
      ),
    );
  }
}
