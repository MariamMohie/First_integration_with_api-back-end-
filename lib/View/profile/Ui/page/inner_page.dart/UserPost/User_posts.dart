import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_api2/View/profile/Ui/page/inner_page.dart/EditPost.dart';
import 'package:project_api2/View/profile/Ui/page/inner_page.dart/UserPost/cubit/cubit/user_post_cubit.dart';
import 'package:project_api2/View/profile/Ui/page/inner_page.dart/deletePostScreen.dart';
import 'package:project_api2/core/api/dio_consumer.dart';
import 'package:project_api2/core/routing/router.dart';
import 'package:project_api2/core/theming/colors/color.dart';
import 'package:project_api2/repositories/user_repository.dart';

class UserPosts extends StatelessWidget {
  final List<Map<String, String>> items = List.generate(
    12,
    (index) => {
      "title": "title ${index + 1}",
      "imageUrl":
          "https://img.freepik.com/free-photo/athlete-playing-sport-with-hand-drawn-doodles_23-2150036347.jpg?ga=GA1.1.1454705726.1706974768&semt=ais_hybrid", // Placeholder image URL
    },
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserPostCubit(userRepo(api: DioConsumer(dio: Dio())))
        ..getaUserPosts(),
      child: BlocConsumer<UserPostCubit, UserPostState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<UserPostCubit>(context);
          return Scaffold(
            body: 
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  // ElevatedButton(
                  //   onPressed: () {
                  //     cubit.getaUserPosts();
                  //   },
                  //   child: Text('Add New Post'),
                  //   style: ElevatedButton.styleFrom(
                  //     primary:
                  //         colors.primary, // Use the same color as your theme
                  //     onPrimary: Colors.white, // Text color
                  //   ),
                  // ),
                  const SizedBox(
                      height: 16.0), // Spacing between button and GridView
              state  is GetPostsLoading
                          ? Center(
                            child: const CircularProgressIndicator(
                                color: colors.primary,
                              ),
                          )
                          : state is GetPostsSuccess
                              ? 
                Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // 2 items per row
                        crossAxisSpacing:
                            8.0, // Horizontal spacing between items
                        mainAxisSpacing: 8.0, // Vertical spacing between items
                        childAspectRatio: 0.8, // Aspect ratio of the items
                      ),
                      itemCount: state.Profile.posts.length,
                      itemBuilder: (context, index) {
                        return GridItem(
                          title: state.Profile.posts[index].title,
                          imageUrl: items[index]['imageUrl']!,
                        );
                      },
                    ),
                  )
                  :Container(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final String title;
  final String imageUrl;

  const GridItem({
    Key? key,
    required this.title,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.grey[200], // Light grey background
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.edit, color: colors.primary),
                  onPressed: () {
                    context.navigateTo(EditPost());
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: colors.primary),
                  onPressed: () {
                    context.navigateTo(DeletePost());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
