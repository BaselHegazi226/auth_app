import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repos/auth_repo/auth_repo.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthStates> {
  final AuthRepo authRepo;

  AuthBloc({
    required this.authRepo,
  }) : super(AuthInitial()) {
    // Register event handlers here directly
    on<SignInEvent>(_onSignInWithEmailAndPasswordEvent);
    on<SignUpEvent>(_onSignUpWithEmailAndPasswordEvent);
    on<SignOutEvent>(_onSignOutEvent);
    on<VerifyEmailEvent>(_onVerifyEmailEvent);
    on<ForgetPasswordEvent>(_onForgetPassword);
  }

  Future<void> _onSignUpWithEmailAndPasswordEvent(
      SignUpEvent event, Emitter<AuthStates> emit) async {
    emit(SignUpLoading());
    var result = await authRepo.signUp(
      email: event.email,
      password: event.password,
    );
    result.fold(
      (failure) {
        return emit(
          SignUpFailure(errorMessage: failure.errorMessage),
        );
      },
      (success) {
        return emit(
            SignUpSuccess(email: event.email, password: event.password));
      },
    );
  }

  Future<void> _onVerifyEmailEvent(
      VerifyEmailEvent event, Emitter<AuthStates> emit) async {
    emit(VerifyEmailLoading());
    var result = await authRepo.verifyEmail();
    result.fold((failure) {
      return emit(VerifyEmailFailure(errorMessage: failure.errorMessage));
    }, (success) {
      emit(VerifyEmailSuccess());
    });
  }

  Future<void> _onForgetPassword(
      ForgetPasswordEvent event, Emitter<AuthStates> emit) async {
    emit(ForgetPasswordLoading());
    var result = await authRepo.forgetPassword(email: event.email);
    result.fold((error) {
      emit(ForgetPasswordFailure(errorMessage: error.errorMessage));
    }, (success) {
      emit(ForgetPasswordSuccess());
    });
  }

  Future<void> _onSignInWithEmailAndPasswordEvent(
      SignInEvent event, Emitter<AuthStates> emit) async {
    emit(SignInLoading());
    var result = await authRepo.signIn(
      email: event.email,
      password: event.password,
    );
    result.fold(
      (failure) {
        print('failure from sign in event in bloc ${failure.errorMessage}');
        return emit(
          SignInFailure(errorMessage: failure.errorMessage),
        );
      },
      (success) {
        return emit(
            SignInSuccess(email: event.email, password: event.password));
      },
    );
  }

  Future<void> _onSignOutEvent(
      SignOutEvent event, Emitter<AuthStates> emit) async {
    emit(SignOutLoading());
    var result = await authRepo.signOut();
    result.fold(
      (failure) {
        return emit(SignInFailure(errorMessage: failure.errorMessage));
      },
      (success) {
        return emit(SignOutSuccess());
      },
    );
  }
}

class AuthSocialBloc extends Bloc<AuthEvent, AuthStates> {
  final AuthRepo authRepo;

  AuthSocialBloc({
    required this.authRepo,
  }) : super(AuthInitial()) {
    on<SignInWithGoogleEvent>(_onSignInWithGoogle);
    on<SignInWithFacebookEvent>(_onSignInWithFacebook);
    on<SignInWithMacEvent>(_onSignInWithMac);
    on<SignInWithPhoneEvent>(_onSignInWithPhoneNumber);
    on<VerifyPhoneNumberEvent>(_onVerifyPhoneNumber);
  }

  Future<void> _onSignInWithGoogle(
      SignInWithGoogleEvent event, Emitter<AuthStates> emit) async {
    emit(SignInWithGoogleLoading());
    var result = await authRepo.signInWithGoogle();
    result.fold((failure) {
      return emit(SignInWithGoogleFailure(errorMessage: failure.errorMessage));
    }, (success) {
      return emit(SignInWithGoogleSuccess());
    });
  }

  Future<void> _onSignInWithFacebook(
      SignInWithFacebookEvent event, Emitter<AuthStates> emit) async {
    emit(SignInWithFacebookLoading());
    var result = await authRepo.signInWithFaceBook();
    result.fold((failure) {
      return emit(
          SignInWithFacebookFailure(errorMessage: failure.errorMessage));
    }, (success) {
      return emit(SignInWithFacebookSuccess());
    });
  }

  Future<void> _onSignInWithMac(
      SignInWithMacEvent event, Emitter<AuthStates> emit) async {
    emit(SignInWithMacLoading());
    var result = await authRepo.signInWithMac();
    result.fold((error) {
      return emit(SignInWithMacFailure(errorMessage: error.errorMessage));
    }, (success) {
      return emit(SignInWithMacSuccess());
    });
  }

  Future<void> _onSignInWithPhoneNumber(
      SignInWithPhoneEvent event, Emitter<AuthStates> emit) async {
    emit(SignInWithPhoneLoading());
    var result = await authRepo.signInWithPhone(
      phone: event.phoneNumber,
      smsCode: event.smsCode,
    );
    result.fold((error) {
      emit(SignInWithFacebookFailure(errorMessage: error.errorMessage));
    }, (success) {
      emit(SignInWithPhoneSuccess());
    });
  }

  Future<void> _onVerifyPhoneNumber(
      VerifyPhoneNumberEvent event, Emitter<AuthStates> emit) async {
    emit(VerifyPhoneLoading());
    var result = await authRepo.verifyPhoneNumber(
      verifyId: event.verifyId,
      smsCode: event.smsCode,
    );
    result.fold((error) {
      emit(VerifyPhoneFailure(errorMessage: error.errorMessage));
    }, (successCredential) {
      emit(VerifyPhoneSuccess());
    });
  }
}
