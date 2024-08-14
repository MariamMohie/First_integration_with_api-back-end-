import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:project_api2/Model%20View/Profile/user_model.dart';
import 'package:project_api2/repositories/user_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.userrepo) : super(ProfileInitial());

  final userRepo userrepo;
   bool isProfileSelected = true;
  TextEditingController user_name_controller =TextEditingController();
  TextEditingController user_email_cntroller =TextEditingController();
  TextEditingController user_pass_controller =TextEditingController();
  TextEditingController user_bio_controller =TextEditingController();

  XFile ?profilePic;


  void toggleProfileSection(bool isSelected) {
    isProfileSelected = isSelected;
    emit(ProfileToggleState()); // Emit a new state to rebuild the UI
  }

  getuserProfile() async {
    emit(GetUserLoading());
    final response = await userrepo.getUserProfile();
    response.fold(
      (errMessage) => emit(GetUserFailure(errMessage: errMessage)),
      (user) => emit(GetUserSuccess(user: user)),
    );
  }

  uploadProfilePic(XFile image) {
    profilePic = image;
    emit(UploadProfilePic());
  }


 
  getdataChach() async {
    emit(GetUserLoading());
  final  data =await userrepo.getdataChach();
    data.fold((errormessage) {
      
      emit(GetUserFailure(errMessage: errormessage));
    }, (data) {
      emit(GetuserSuccess(data: data));
    });
  }




  
}