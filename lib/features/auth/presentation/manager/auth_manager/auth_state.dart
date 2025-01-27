part of 'auth_bloc.dart';

@immutable
sealed class AuthStates {}

final class AuthInitial extends AuthStates {}

//Sign In
class SignInInitial extends AuthStates {}

class SignInSuccess extends AuthStates {
  final String email, password;
  SignInSuccess({
    required this.email,
    required this.password,
  });
}

class SignInFailure extends AuthStates {
  final String errorMessage;
  SignInFailure({
    required this.errorMessage,
  });
}

class SignInLoading extends AuthStates {}

//Sign In with Google
//Sign In with Mac
//Sign In with Facebook

//Sing Up
class SignUpInitial extends AuthStates {}

class SignUpSuccess extends AuthStates {
  final String email, password;
  SignUpSuccess({
    required this.email,
    required this.password,
  });
}

class SignUpFailure extends AuthStates {
  final String errorMessage;
  SignUpFailure({
    required this.errorMessage,
  });
}

class SignUpLoading extends AuthStates {}

//verify email after sign up
class VerifyEmailInitial extends AuthStates {}

class VerifyEmailSuccess extends AuthStates {}

class VerifyEmailFailure extends AuthStates {
  final String errorMessage;
  VerifyEmailFailure({
    required this.errorMessage,
  });
}

class VerifyEmailLoading extends AuthStates {}

//Sign out
class SignOutInitial extends AuthStates {}

class SignOutSuccess extends AuthStates {}

class SignOutFailure extends AuthStates {
  final String errorMessage;
  SignOutFailure({
    required this.errorMessage,
  });
}

class SignOutLoading extends AuthStates {}

//Sign in With google
class SignInWithGoogleInitial extends AuthStates {}

class SignInWithGoogleSuccess extends AuthStates {}

class SignInWithGoogleFailure extends AuthStates {
  final String errorMessage;
  SignInWithGoogleFailure({
    required this.errorMessage,
  });
}

class SignInWithGoogleLoading extends AuthStates {}

//Sign in With mac
class SignInWithMacInitial extends AuthStates {}

class SignInWithMacSuccess extends AuthStates {}

class SignInWithMacFailure extends AuthStates {
  final String errorMessage;
  SignInWithMacFailure({
    required this.errorMessage,
  });
}

class SignInWithMacLoading extends AuthStates {}

//Sign in With facebook
class SignInWithFacebookInitial extends AuthStates {}

class SignInWithFacebookSuccess extends AuthStates {}

class SignInWithFacebookFailure extends AuthStates {
  final String errorMessage;
  SignInWithFacebookFailure({
    required this.errorMessage,
  });
}

class SignInWithFacebookLoading extends AuthStates {}

//Forget password States
class ForgetPasswordInitial extends AuthStates {}

class ForgetPasswordSuccess extends AuthStates {}

class ForgetPasswordFailure extends AuthStates {
  final String errorMessage;
  ForgetPasswordFailure({required this.errorMessage});
}

class ForgetPasswordLoading extends AuthStates {}

//Sign in With Phone
class SignInWithPhoneInitial extends AuthStates {}

class SignInWithPhoneSuccess extends AuthStates {
  final PhoneAuthCredential phoneAuthCredential;
  SignInWithPhoneSuccess({required this.phoneAuthCredential});
}

class SignInWithPhoneFailure extends AuthStates {
  final String errorMessage;
  SignInWithPhoneFailure({
    required this.errorMessage,
  });
}

class SignInWithPhoneLoading extends AuthStates {}

//verify phone after sign in with phone
class VerifyPhoneInitial extends AuthStates {}

class VerifyPhoneSuccess extends AuthStates {}

class VerifyPhoneFailure extends AuthStates {
  final String errorMessage;
  VerifyPhoneFailure({
    required this.errorMessage,
  });
}

class VerifyPhoneLoading extends AuthStates {}
