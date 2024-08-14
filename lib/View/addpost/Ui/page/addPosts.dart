import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_api2/View/Home/Ui/page/Home.dart';
import 'package:project_api2/View/addpost/Ui/widgets/addphoto.dart';
import 'package:project_api2/View/addpost/Ui/widgets/contenttext.dart';
import 'package:project_api2/View/addpost/Ui/widgets/pageHead.dart';
import 'package:project_api2/View/addpost/Ui/widgets/postButton.dart';
import 'package:project_api2/View/addpost/Ui/widgets/title_post.dart';
import 'package:project_api2/View/addpost/Ui/widgets/uploadButtons.dart';
import 'package:project_api2/View/addpost/cubit/cubit/addpost_cubit.dart';
import 'package:project_api2/core/api/dio_consumer.dart';
import 'package:project_api2/core/routing/router.dart';
import 'package:project_api2/core/theming/colors/color.dart';
import 'package:project_api2/core/theming/size/size.dart';
import 'package:project_api2/repositories/user_repository.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class AddPost extends StatelessWidget {
  const AddPost({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddpostCubit(userRepo(api: DioConsumer(dio: Dio()))),
      child: BlocConsumer<AddpostCubit, AddpostState>(
        listener: (context, state) {
          if (state is Addpostsuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("succes"),
              ),
            );
            context.navigateTo(Home());
          } else if (state is Addpostfail) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errormessage),
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<AddpostCubit>(context);
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const PageHead(
                      title: 'Add Post',
                    ),
                    title_post(
                      hintText: 'Post title',
                      controller: cubit.titleController,
                    ),
                    size.height(20),
                    contentText(
                      labelText: 'Content',
                      hintText: 'Content',
                      suffixIcon: false,
                      controller: cubit.contentController,
                    ),
                    size.height(20),
                    state is UploadProfilePic
                        ? Container(
                            width: MediaQuery.sizeOf(context).width * .9,
                            height: 300,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: FileImage(File(cubit.postPick!.path)),
                              ),
                            ))
                        : GestureDetector(
                            onTap: () {
                              WoltModalSheet.show<void>(
                                context: context,
                                pageListBuilder: (modalSheetContext) {
                                  return [
                                    WoltModalSheetPage(
                                      backgroundColor: colors.background,
                                      child: UploadButtons(
                                        onPressed_Upload: () {
                                          ImagePicker()
                                              .pickImage(
                                                  source: ImageSource.gallery)
                                              .then((value) => cubit
                                                  .uploadProfilePic(value!));
                                        },
                                        onPressed_Camera: () {
                                          ImagePicker()
                                              .pickImage(
                                                  source: ImageSource.camera)
                                              .then((value) => cubit
                                                  .uploadProfilePic(value!));
                                        },
                                      ),
                                    ),
                                  ];
                                },
                              );
                            },
                            child: AddPhoto(),
                          ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        maxLines: 3,
                        controller:cubit.tagCommentController ,
                        decoration: InputDecoration(
                          labelText: 'Tag Comment',
                          labelStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                      ),
                    ),
                    size.height(40),
                    PostButton(
                      innerText: 'Post',
                      onPressed: () {
                         cubit.addPosts();
                      },
                      buttoncolor: colors.primary,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
