part of 'addpost_cubit.dart';

@immutable
sealed class AddpostState {}

final class AddpostInitial extends AddpostState {}



final class NotAddPost extends AddpostState {}


final class AddPostdata extends AddpostState {}



final class UploadProfilePic extends AddpostState  {}



final class Addpostloading extends AddpostState {}

final class Addpostsuccess extends AddpostState {
  final AddPostModel data;

  Addpostsuccess({required this.data});
}

final class Addpostfail extends AddpostState {
  final String errormessage;

  Addpostfail({required this.errormessage});

}
