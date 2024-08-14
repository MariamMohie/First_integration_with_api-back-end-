part of 'signin_cubit.dart';

@immutable
sealed class SigninState {}

final class SigninInitial extends SigninState {}



final class SignInSuccess extends SigninState {}

final class SignInloading extends SigninState {}

final class SignInfailer extends SigninState {
  final String errorMessage;

  SignInfailer({required this.errorMessage});
}
