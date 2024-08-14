import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:project_api2/Model%20View/Login/loginModel.dart';
import 'package:project_api2/repositories/auth_repository.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.userrepo) : super(SigninInitial());

  final AuthRepo userrepo;

  
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  SignInModel? user;

  signin() async {
    emit(SignInloading());
    final response = await userrepo.sign_in(
        email: emailController.text, pass: passwordController.text);
    response.fold((erromessage) {
      emit(SignInfailer(errorMessage: erromessage));
    }, (LoginModel) {
      emit(SignInSuccess());
    });
  }
}
