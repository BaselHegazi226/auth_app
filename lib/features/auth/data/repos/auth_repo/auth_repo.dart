import 'package:dartz/dartz.dart';

import '../../../../../core/error/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, void>> signIn({
    required String email,
    required String password,
  });
  Future<Either<Failure, void>> signUp({
    required String email,
    required String password,
  });
  Future<Either<Failure, void>> forgetPassword({required String email});
  Future<Either<Failure, void>> verifyEmail();
  Future<Either<Failure, bool>> checkVerifyEmail();
  Future<Either<Failure, void>> signInWithGoogle();
  Future<Either<Failure, void>> signInWithFaceBook();
  Future<Either<Failure, void>> signInWithMac();
  Future<Either<Failure, void>> signOut();
}
