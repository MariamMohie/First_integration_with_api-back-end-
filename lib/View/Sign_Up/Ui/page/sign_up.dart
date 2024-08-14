import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_api2/View/Home/Ui/page/Home.dart';
import 'package:project_api2/View/Sign_Up/Ui/widget/actions/button.dart';
import 'package:project_api2/View/Sign_Up/Ui/widget/actions/textbottom.dart';
import 'package:project_api2/View/Sign_Up/Ui/widget/image/image.dart';
import 'package:project_api2/View/Sign_Up/Ui/widget/header/pageHeading.dart';
import 'package:project_api2/View/Sign_Up/Ui/widget/textfiled/textfiled.dart';
import 'package:project_api2/View/Sign_Up/cubit/cubit/signup_cubit.dart';
import 'package:project_api2/View/Sign_in/Ui/page/Signin.dart';
import 'package:project_api2/core/api/dio_consumer.dart';
import 'package:project_api2/core/routing/router.dart';
import 'package:project_api2/repositories/auth_repository.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(AuthRepo(api: DioConsumer(dio: Dio()))),
      child: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          } else if (state is SignUpFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errMessage),
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<SignupCubit>(context);
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: cubit.signUpFormKey,
                  child: Column(
                    children: [
                      //  PageHeader(),
                      PageHeading(title: "Sign Up"),
                      cubit.profilePic == null
                          ? PickImageWidget(
                              onclick: () {
                                ImagePicker()
                                    .pickImage(source: ImageSource.camera)
                                    .then((value) =>
                                        cubit.uploadProfilePic(value!));
                              },
                            )
                          : CircleAvatar(
                              radius: 60,
                              backgroundImage:
                                  FileImage(File(cubit.profilePic!.path)),
                            ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Bio",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            TextField(
                              controller: cubit.bioController,
                              maxLines: 5, // Allows multiple lines of input
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                hintText: 'Tell us about yourself',
                              ),
                            ),
                          ],
                        ),
                      ),

                      textfiled(
                        labelText: 'Name',
                        hintText: 'Your name',
                        isDense: true,
                        controller: cubit.signup_first_name,
                      ),
                      const SizedBox(height: 16),

                      const SizedBox(height: 16),
                      //!Email
                      textfiled(
                        labelText: 'Email',
                        hintText: 'Your email',
                        isDense: true,
                        controller: cubit.signup_email,
                      ),

                      const SizedBox(height: 16),
                      //! Password
                      textfiled(
                        labelText: 'Password',
                        hintText: 'Your password',
                        isDense: true,
                        obscureText: true,
                        suffixIcon: true,
                        controller: cubit.signup_password,
                      ),
                      const SizedBox(height: 16),

                      state is SignUpLoading
                          ? CircularProgressIndicator()
                          : CustomFormButton(
                              innerText: 'Signup',
                              onPressed: () {
                                cubit.sign_up();
                                context.navigateTo(Home());
                              },
                            ),
                      const SizedBox(height: 18),
                      //! Already have an account widget
                      textbottom(
                        onPressed: () {
                          context.navigateTo(SignIn());
                        },
                        text: 'Already have an account ? ',
                        buttonname: 'Log-in',
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
