part of 'user_post_cubit.dart';

@immutable
sealed class UserPostState {}

final class UserPostInitial extends UserPostState {}
class GetPostsSuccess extends UserPostState {
  
     UserPostsModel Profile;
     GetPostsSuccess({required this.Profile});
}
class GetPostsLoading extends UserPostState {}


class GetPostsFailure extends UserPostState {
  final String errMessage;
  GetPostsFailure({required this.errMessage});
}
