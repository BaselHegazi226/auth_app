part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class SignInEvent extends AuthEvent {
  final String email, password;
  SignInEvent({
    required this.email,
    required this.password,
  });
}

class SignUpEvent extends AuthEvent {
  final String email, password;
  SignUpEvent({
    required this.email,
    required this.password,
  });
}

class SignInWithGoogleEvent extends AuthEvent {}

class SignInWithPhoneEvent extends AuthEvent {
  final String phoneNumber;
  SignInWithPhoneEvent({
    required this.phoneNumber,
  });
}

class VerifyPhoneNumberEvent extends AuthEvent {
  final String verifyId, smsCode;
  VerifyPhoneNumberEvent({required this.verifyId, required this.smsCode});
}

class VerifyEmailEvent extends AuthEvent {}

class ForgetPasswordEvent extends AuthEvent {
  final String email;
  ForgetPasswordEvent({required this.email});
}

class SignInWithMacEvent extends AuthEvent {}

class SignInWithFacebookEvent extends AuthEvent {}

class SignOutEvent extends AuthEvent {}
