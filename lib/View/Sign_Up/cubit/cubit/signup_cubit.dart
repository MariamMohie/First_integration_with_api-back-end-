import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_api2/Model%20View/Sign%20up/sign_upModel.dart';
import 'package:project_api2/View/addpost/cubit/cubit/addpost_cubit.dart';
import 'package:project_api2/repositories/auth_repository.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.uthrepo) : super(SignupInitial());

  final AuthRepo uthrepo;
  XFile? profilePic;

  GlobalKey<FormState> signUpFormKey = GlobalKey();

  uploadProfilePic(XFile image) {
    profilePic = image;
    emit(SignupProfilePicUpdated(profilePic!));
  }

  TextEditingController signup_email = TextEditingController();
  TextEditingController signup_password = TextEditingController();
  TextEditingController signup_first_name = TextEditingController();
  TextEditingController bioController = TextEditingController();

  SignUpModel? user;
  sign_up() async {
    emit(SignUpLoading());
    final response = await uthrepo.sign_up(
      email: signup_email.text,
      pass: signup_password.text,
      name: signup_first_name.text,
      bio: bioController.text,
      profilePic: profilePic!,
    );
    print(bioController.text);
    response.fold((errormessage) {
      emit(SignUpFailure(errMessage: errormessage));
    }, (SignUpModel) {
      emit(SignUpSuccess(message: SignUpModel.message));
    });
  }
}
