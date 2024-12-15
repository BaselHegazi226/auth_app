import 'dart:convert';
import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../../../core/error/failure.dart';
import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  var auth = FirebaseAuth.instance;

  @override
  Future<Either<Failure, void>> signIn(
      {required String email, required String password}) async {
    try {
      UserCredential signInCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return right(null);
    } on FirebaseAuthException catch (authException) {
      return left(
          FirebaseFailure.fromFirebaseAuthException(exception: authException));
    } on FirebaseException catch (exception) {
      return left(FirebaseFailure.fromFirebaseException(exception: exception));
    } catch (e) {
      return left(FirebaseFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signUp({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential signUpCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      return right(null);
    } on FirebaseAuthException catch (authException) {
      return left(
          FirebaseFailure.fromFirebaseAuthException(exception: authException));
    } on FirebaseException catch (exception) {
      return left(FirebaseFailure.fromFirebaseException(exception: exception));
    } catch (e) {
      return left(FirebaseFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      User? user = auth.currentUser;
      if (user != null) {
        for (var userInfo in user.providerData) {
          switch (userInfo.providerId) {
            case 'google.com':
              final GoogleSignIn googleSignIn = GoogleSignIn();
              googleSignIn.signOut();
            case 'password.com':
              var credentials = await FirebaseAuth.instance.signOut();
            case 'facebook.com':
              var facebookAuth = await FacebookAuth.instance.logOut();
          }
        }
      }
      return right(null);
    } on FirebaseAuthException catch (authException) {
      return left(
          FirebaseFailure.fromFirebaseAuthException(exception: authException));
    } on FirebaseException catch (exception) {
      return left(FirebaseFailure.fromFirebaseException(exception: exception));
    } catch (e) {
      return left(FirebaseFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleSignInAccount.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
      }
      return right(null);
    } on FirebaseAuthException catch (authException) {
      return left(
          FirebaseFailure.fromFirebaseAuthException(exception: authException));
    } on FirebaseException catch (exception) {
      return left(FirebaseFailure.fromFirebaseException(exception: exception));
    } on PlatformException catch (e) {
      return left(FirebaseFailure(errorMessage: e.toString()));
    } catch (e) {
      return left(FirebaseFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signInWithMac() async {
    try {
      final rawNonce = generateNonce();
      final nonce = sha256ofString(rawNonce);

      // Request credential for the currently signed in Apple account.
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );

      // Create an `OAuthCredential` from the credential returned by Apple.
      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );

      // Sign in the user with Firebase. If the nonce we generated earlier does
      // not match the nonce in `appleCredential.identityToken`, sign in will fail.
      await FirebaseAuth.instance.signInWithCredential(oauthCredential);
      return right(null);
    } on FirebaseAuthException catch (authException) {
      return left(
          FirebaseFailure.fromFirebaseAuthException(exception: authException));
    } on FirebaseException catch (exception) {
      return left(FirebaseFailure.fromFirebaseException(exception: exception));
    } on PlatformException catch (e) {
      return left(FirebaseFailure(errorMessage: e.toString()));
    } catch (e) {
      return left(FirebaseFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signInWithFaceBook() async {
    try {
      // Request specific permissions for Facebook login
      final LoginResult loginResult = await FacebookAuth.instance.login(
        permissions: ['email', 'public_profile'], // Request these permissions
      );
      // Handle login result
      if (loginResult.status == LoginStatus.success &&
          loginResult.accessToken != null) {
        // If login is successful & login access token is not null, get the OAuth credentials
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(
                loginResult.accessToken!.tokenString);
        await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential);
        return right(null); // Login successful
      } else if (loginResult.status == LoginStatus.cancelled) {
        print('facebook error: ${loginResult.message}');
        // User cancelled login
        return left(FirebaseFailure(errorMessage: 'Login cancelled by user.'));
      } else {
        // Other issues (e.g., login failed)
        return left(FirebaseFailure(errorMessage: 'Facebook login failed.'));
      }
    } on FirebaseAuthException catch (authException) {
      print('facebook auth exception:$authException');
      return left(
          FirebaseFailure.fromFirebaseAuthException(exception: authException));
    } on FirebaseException catch (exception) {
      print('facebook firebase exception:$exception');
      return left(FirebaseFailure.fromFirebaseException(exception: exception));
    } on PlatformException catch (e) {
      print('facebook platform exception:$e');
      return left(FirebaseFailure(errorMessage: e.toString()));
    } catch (e) {
      return left(FirebaseFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> verifyEmail() async {
    try {
      if (auth.currentUser != null && !auth.currentUser!.emailVerified) {
        await auth.currentUser!.sendEmailVerification();
      }
      return right(null);
    } on FirebaseException catch (exception) {
      return left(FirebaseFailure.fromFirebaseException(exception: exception));
    } on PlatformException catch (e) {
      return left(FirebaseFailure(errorMessage: e.toString()));
    } catch (e) {
      return left(FirebaseFailure(errorMessage: e.toString()));
    }
  }

  /// Checks if the currently signed-in user has verified their email.
  @override
  Future<Either<Failure, bool>> checkVerifyEmail() async {
    try {
      if (auth.currentUser != null) {
        await auth.currentUser!.reload(); // Refresh user data
        return right(auth.currentUser!.emailVerified);
      }
      return left(
          FirebaseFailure(errorMessage: 'No user is currently signed in.'));
    } on FirebaseException catch (exception) {
      return left(FirebaseFailure.fromFirebaseException(exception: exception));
    } on PlatformException catch (e) {
      return left(FirebaseFailure(errorMessage: e.toString()));
    } catch (e) {
      return left(FirebaseFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> forgetPassword({required String email}) async {
    try {
      auth.sendPasswordResetEmail(email: email);
      return right(null);
    } on FirebaseException catch (exception) {
      return left(FirebaseFailure.fromFirebaseException(exception: exception));
    } on PlatformException catch (e) {
      return left(FirebaseFailure(errorMessage: e.toString()));
    } catch (e) {
      return left(FirebaseFailure(errorMessage: e.toString()));
    }
  }

//phone
  @override
  Future<Either<Failure, void>> signInWithPhone({required String phone}) async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException error) {},
        codeSent: (String verificationId, int? forceResendingToken) async {
          String smsCode = 'xxxx';
          // Create a PhoneAuthCredential with the code
          PhoneAuthCredential credential = PhoneAuthProvider.credential(
              verificationId: verificationId, smsCode: smsCode);
          // Sign the user in (or link) with the credential
          await auth.signInWithCredential(credential);
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      return right(null);
    } on FirebaseException catch (exception) {
      return left(FirebaseFailure.fromFirebaseException(exception: exception));
    } on PlatformException catch (e) {
      return left(FirebaseFailure(errorMessage: e.toString()));
    } catch (e) {
      return left(FirebaseFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> checkVerifyPhone() {
    // TODO: implement checkVerifyPhone
    throw UnimplementedError();
  }
}

String generateNonce([int length = 32]) {
  final charset =
      '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
  final random = Random.secure();
  return List.generate(length, (_) => charset[random.nextInt(charset.length)])
      .join();
}

/// Returns the sha256 hash of [input] in hex notation.
String sha256ofString(String input) {
  final bytes = utf8.encode(input);
  final digest = sha256ofString(input);
  return digest.toString();
}
