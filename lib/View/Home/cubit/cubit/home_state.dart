part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}



class HomeMenuDrawerOpen extends HomeState {}

class HomeProfileDrawerOpen extends HomeState {}


class GetPostsSuccess extends HomeState {
  
     HomeModel home;
     GetPostsSuccess({required this.home});
}
class GetPostsLoading extends HomeState {}


class GetPostsFailure extends HomeState {
  final String errMessage;
  GetPostsFailure({required this.errMessage});
}




class LogoutLoading extends HomeState {}

class LogoutSuccess extends HomeState {}

class LogoutFailure extends HomeState {
  final String errMessage;
  LogoutFailure({required this.errMessage});
}
