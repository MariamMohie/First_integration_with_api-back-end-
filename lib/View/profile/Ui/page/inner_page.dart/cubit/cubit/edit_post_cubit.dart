import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'edit_post_state.dart';

class EditPostCubit extends Cubit<EditPostState> {
  EditPostCubit() : super(EditPostInitial());

  TextEditingController EditTitleController =TextEditingController();
  TextEditingController EditContentController =TextEditingController();

}
