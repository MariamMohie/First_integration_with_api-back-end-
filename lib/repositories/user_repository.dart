import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_api2/Model%20View/Profile/user_model.dart';
import 'package:project_api2/Model%20View/UserPosts/UserPosts_Model.dart';
import 'package:project_api2/Model%20View/addpost/addpostModel.dart';
import 'package:project_api2/Model%20View/home/homeModel.dart';
import 'package:project_api2/cache/cache_healper.dart';
import 'package:project_api2/core/api/api_consumer.dart';
import 'package:project_api2/core/api/endPointes.dart';
import 'package:project_api2/core/errors/exceptions.dart';
import 'package:project_api2/core/functions/imagepacker.dart';

class userRepo {
  final ApiConsumer api;

  userRepo({required this.api});

  Future<Either<String, UserModel>> getUserProfile() async {
    try {
      final response = await api.get(
        EndPoint.getuserDataEndPoint(
          CacheHelper().getData(key: ApiKey.id),
        ),
      );
      return Right(UserModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, Map<String, dynamic>>> getdataChach() async {
    print("enter function");
    try {
      final Map<String, dynamic> data = {};
      data[ApiKey.email] = await CacheHelper().getData(key: ApiKey.email);
      data[ApiKey.name] = await CacheHelper().getData(key: ApiKey.name);
      data[ApiKey.token] = await CacheHelper().getData(key: ApiKey.token);
      data[ApiKey.bio] = await CacheHelper().getData(key: ApiKey.bio);
       
      print(
          "email ${data[ApiKey.email]}   name ${data[ApiKey.name]}  token ${data[ApiKey.token]}");

      print("end function ");
      return Right(data);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

//! get all Posts in Home Screen
  Future<Either<String, HomeModel>> getallPosts() async {
    try {
      final response = await api.get(
        EndPoint.createPosts,
      );
      final posts = HomeModel.fromJson(response);
      return Right(posts);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }
  //! Get User's Posts in Profile Screen
Future<Either<String, UserPostsModel>> getUserPosts() async {
 
    try {
       String? userPost_id = CacheHelper().getData(key: ApiKey.id).toString();
      final response = await api.get(
        EndPoint.getuserDataEndPoint(userPost_id),
      );
      final Userposts = UserPostsModel.fromJson(response);
      return Right(Userposts);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

//! Add Posts

  Future<Either<String, AddPostModel>> addPosts(
      {required String title,
      required String postContent,
      required XFile image,
      required String user_id,
      required String tagComment}) async {
    try {
      String? user_id = CacheHelper().getData(key: ApiKey.id).toString();
      final response =
          await api.post(EndPoint.createPosts, isFromData: true, data: {
        ApiKey.title: title,
        ApiKey.PostContent: postContent,
        ApiKey.user_id: user_id,
        ApiKey.tag_comment: tagComment,
        ApiKey.PostImage: await uploadImageToAPI(image)
      });

      final added = AddPostModel.fromJson(response);

      return Right(added);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }
}
