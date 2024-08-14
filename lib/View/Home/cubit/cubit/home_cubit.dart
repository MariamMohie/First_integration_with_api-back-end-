import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:meta/meta.dart';
import 'package:project_api2/Model%20View/home/homeModel.dart';
import 'package:project_api2/repositories/auth_repository.dart';
import 'package:project_api2/repositories/user_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.userrepo , this.userrepo2) : super(HomeInitial());

  bool list_view = false;



  final advancedDrawerController = AdvancedDrawerController();

 void openMenuDrawer() {
    emit(HomeMenuDrawerOpen());
    advancedDrawerController.showDrawer();
  }

  void openProfileDrawer() {
    emit(HomeProfileDrawerOpen());
    advancedDrawerController.showDrawer();
  }

final AuthRepo userrepo;

  // Future<void> logout() async {
  //   try {
  //     emit(LogoutLoading());
  //   //  final token = CacheHelper().getData(key: ApiKey.token);
  //     final response = await api.post(
  //       EndPoint.logout,
  //     );
  //      CacheHelper().removeData(key: ApiKey.token);
  //      CacheHelper().removeData(key: ApiKey.id);
  //         CacheHelper().removeData(key: ApiKey.name);
  //     print("loged out");
  //     emit(LogoutSuccess());
  //   } on DioException catch (e) {
  //     emit(LogoutFailure(errMessage: e.toString()));
  //   } catch (e) {
  //     emit(LogoutFailure(errMessage: e.toString()));
  //   }
  // }

  Future<void> logout() async {
    emit(LogoutLoading());
    //  final token = CacheHelper().getData(key: ApiKey.token);
    final response = await userrepo.logout();
    response.fold((erromessage) {
      emit(LogoutFailure(errMessage: erromessage));
    }, (LogoutModel) {
      emit(LogoutSuccess());
    });
  }

  final userRepo userrepo2;

  Future<void> getallPosts() async {
    emit(GetPostsLoading());
    final data = await userrepo2.getallPosts();
    data.fold((errormessage) {
      emit(GetPostsFailure(errMessage: errormessage));
    }, (posts) {
      emit(GetPostsSuccess(home: posts));
    });
  }


  
}
