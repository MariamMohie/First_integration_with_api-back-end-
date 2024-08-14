part of 'signup_cubit.dart';

@immutable
sealed class SignupState {
  get data => null;
}

final class SignupInitial extends SignupState {}



final class SignUpSuccess extends SignupState {
  final String message;

  SignUpSuccess({required this.message});
}

class SignupProfilePicUpdated extends SignupState {
  final XFile profilePic;
  SignupProfilePicUpdated(this.profilePic);
}
final class SignUpLoading extends SignupState {}

final class SignUpFailure extends SignupState {
  final String errMessage;

  SignUpFailure({required this.errMessage});
}
