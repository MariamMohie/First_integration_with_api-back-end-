import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_api2/Model%20View/Login/loginModel.dart';
import 'package:project_api2/Model%20View/Sign%20up/sign_upModel.dart';
import 'package:project_api2/Model%20View/logout/logoutModel.dart';
import 'package:project_api2/cache/cache_healper.dart';
import 'package:project_api2/core/api/api_consumer.dart';
import 'package:project_api2/core/api/endPointes.dart';
import 'package:project_api2/core/errors/exceptions.dart';
import 'package:project_api2/core/functions/imagepacker.dart';

class AuthRepo {
  final ApiConsumer api;

  AuthRepo({required this.api});




    Future<Either<String, SignInModel>> sign_in(
      {required String email, required String pass}) async {
    try {
      final response = await api.post(EndPoint.signin,
          data: {ApiKey.email: email, ApiKey.password: pass}, isFromData: true);
      final user = SignInModel.fromJson(response);
      CacheHelper().saveData(key: ApiKey.token, value: user.data.token);
      CacheHelper().saveData(key: ApiKey.id, value: user.data.user.id);
      CacheHelper().saveData(key: ApiKey.email, value: user.data.user.email);
      CacheHelper().saveData(key: ApiKey.name, value: user.data.user.name);
      CacheHelper().saveData(key: ApiKey.image, value: user.data.user.image);
      CacheHelper().saveData(key: ApiKey.bio, value: user.data.user.bio);
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, SignUpModel>> sign_up({
    required String email,
    required String pass,
    required String name,
    required String bio,
    required XFile profilePic,
  }) async {
    try {
      final response = await api.post(
        EndPoint.signup,
         isFromData: true, 
         data: {
        ApiKey.email: email,
        ApiKey.password: pass,
        ApiKey.name: name,
        ApiKey.bio: bio,
// to send image
        ApiKey.image: await uploadImageToAPI(profilePic)
      });
       final user = SignUpModel.fromJson(response);
       CacheHelper().saveData(key: ApiKey.token, value: user.data.token);
      CacheHelper().saveData(key: ApiKey.name, value:user.data.user.name );
      CacheHelper().saveData(key: ApiKey.name, value:user.data.user.email );
      CacheHelper().saveData(key: ApiKey.name, value:user.data.user.bio );
      CacheHelper().saveData(key: ApiKey.id, value:user.data.user.id );
      CacheHelper().saveData(key: ApiKey.image, value:user.data.user.image );
     
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

  Future<Either<String, LogoutModel>> logout() async {
    try {
      final response = await api.post(
        EndPoint.logout,
      );
      CacheHelper().removeData(key: ApiKey.token);
      CacheHelper().removeData(key: ApiKey.id);
      CacheHelper().removeData(key: ApiKey.name);
      final response2 = LogoutModel.fromJson(response);

      return Right(response2);
    } on ServerException catch (e) {
      return Left(e.errModel.message);
    }
  }

}