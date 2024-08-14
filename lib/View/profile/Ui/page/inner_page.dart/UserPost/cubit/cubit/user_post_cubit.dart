import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_api2/Model%20View/UserPosts/UserPosts_Model.dart';
import 'package:project_api2/Model%20View/home/homeModel.dart';
import 'package:project_api2/repositories/user_repository.dart';

part 'user_post_state.dart';

class UserPostCubit extends Cubit<UserPostState> {
  UserPostCubit(this.userrepo2) : super(UserPostInitial());


final userRepo userrepo2;


  Future<void> getaUserPosts() async {
    emit(GetPostsLoading());
    final data = await userrepo2.getUserPosts();
    data.fold((errormessage) {
      emit(GetPostsFailure(errMessage: errormessage));
    }, (posts) {
      emit(GetPostsSuccess(Profile: posts));
    });
  }

}
