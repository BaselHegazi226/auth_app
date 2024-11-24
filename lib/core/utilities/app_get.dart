import 'package:auth_with_firebase_application/features/auth/data/repos/auth_repo/auth_repo_impl.dart';
import 'package:get_it/get_it.dart';

class AppGet {
  static final getIt = GetIt.instance;

  static void setUp() {
    getIt.registerSingleton<AuthRepoImpl>(
      AuthRepoImpl(),
    );
  }
}
