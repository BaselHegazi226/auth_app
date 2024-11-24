part of 'verify_cubit.dart';

@immutable
sealed class VerifyEmailState {}

final class VerifyEmailInitial extends VerifyEmailState {}

final class VerifyEmailLoading extends VerifyEmailState {}

final class VerifyEmailFailure extends VerifyEmailState {
  VerifyEmailFailure({
    required this.errorMessage,
  });
  final String errorMessage;
}

final class VerifyEmailSuccess extends VerifyEmailState {}
