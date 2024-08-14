import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_api2/View/Home/Ui/page/Home.dart';
import 'package:project_api2/View/Sign_Up/Ui/page/sign_up.dart';
import 'package:project_api2/View/Sign_Up/Ui/widget/actions/button.dart';
import 'package:project_api2/View/Sign_Up/Ui/widget/actions/textbottom.dart';
import 'package:project_api2/View/Sign_Up/Ui/widget/textfiled/textfiled.dart';
import 'package:project_api2/View/Sign_in/Ui/widgets/actions/forgetpass.dart';
import 'package:project_api2/View/Sign_in/Ui/widgets/header/pageheader.dart';
import 'package:project_api2/View/Sign_in/cubit/cubit/signin_cubit.dart';
import 'package:project_api2/core/api/dio_consumer.dart';
import 'package:project_api2/core/routing/router.dart';
import 'package:project_api2/repositories/auth_repository.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(AuthRepo(api: DioConsumer(dio: Dio()))),
      child: BlocConsumer<SigninCubit, SigninState>(
        listener: (context, state) {
         if (state is SignInSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("succes"),
              ),
            );
            context.navigateTo(Home());
          } else if (state is SignInfailer) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<SigninCubit>(context);
          return Scaffold(
            body: SafeArea(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  //  PageHeading(title: "Login"),
                  PageHeader(),
                  textfiled(
                    labelText: 'Email',
                    hintText: 'Your email',
                    isDense: true,
                    controller: cubit.emailController,
                  ),

                  const SizedBox(height: 15),
                  //! Password
                  textfiled(
                    labelText: 'Password',
                    hintText: 'Your password',
                    isDense: true,
                    obscureText: true,
                    suffixIcon: true,
                    controller: cubit.passwordController,
                  ),
                  const SizedBox(height: 10),
                  ForgetPasswordWidget(),
                  const SizedBox(height: 15),
                state is SignInloading
                      ? CircularProgressIndicator()
                      :  CustomFormButton(
                    innerText: 'Log in',
                    onPressed: () {
                      cubit.signin();
                      // context.navigateTo(Home());
                    },
                  ),
                  const SizedBox(height: 18),
                  //! Already have an account widget
                  textbottom(
                    onPressed: () {
                      context.navigateTo(SignUp());
                    },
                    text: 'Don\'t have an account ? ',
                    buttonname: ' Sign up',
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            )),
          );
        },
      ),
    );
  }
}
