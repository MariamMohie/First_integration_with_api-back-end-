import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_api2/Model%20View/addpost/addpostModel.dart';
import 'package:project_api2/cache/cache_healper.dart';
import 'package:project_api2/core/api/endPointes.dart';
import 'package:project_api2/repositories/user_repository.dart';
part 'addpost_state.dart';

class AddpostCubit extends Cubit<AddpostState> {
  AddpostCubit(this.userrepo) : super(AddpostInitial());

  final userRepo userrepo;

  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController tagCommentController = TextEditingController();

  late Color buttoncolor;
  XFile? postPick;

  uploadProfilePic(XFile image) {
    postPick = image;
    emit(UploadProfilePic());
  }

  surewrite_post() {
    if (titleController.text.isEmpty) {
      emit(NotAddPost());
    } else {
      emit(AddPostdata());
    }
  }

  Future<void> addPosts() async {
    emit(Addpostloading());
    String? user_id = CacheHelper().getData(key: ApiKey.id).toString();
    final data = await userrepo.addPosts(
      title: titleController.text,
      postContent: contentController.text,
      image: postPick!,
      user_id: user_id,
      tagComment: tagCommentController.text,
    );
    data.fold((errormessage) {
      emit(Addpostfail(errormessage: errormessage));
    }, (added) {
      emit(Addpostsuccess(data: added));
    });
  }
}
