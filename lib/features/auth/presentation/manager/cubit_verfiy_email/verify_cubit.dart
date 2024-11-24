import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repos/auth_repo/auth_repo.dart';

part 'verify_state.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  AuthRepo authRepo;
  VerifyEmailCubit({
    required this.authRepo,
  }) : super(VerifyEmailInitial());
  Future<void> verifyEmailFun() async {
    emit(VerifyEmailLoading());
    var result = await authRepo.verifyEmail();
    result.fold(
      (failure) {
        return emit(VerifyEmailFailure(errorMessage: failure.errorMessage));
      },
      (success) {
        return emit(VerifyEmailSuccess());
      },
    );
  }

  // This method is for handling the email link verification callback
  Future<void> checkEmailVerification() async {
    var isVerified = await authRepo.checkVerifyEmail();
    isVerified.fold((failure) {
      return emit(
          VerifyEmailFailure(errorMessage: "Email verification failed."));
    }, (success) {
      return emit(VerifyEmailSuccess());
    });
  }
}
