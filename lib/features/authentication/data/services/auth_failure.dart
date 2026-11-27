import 'package:firebase_auth/firebase_auth.dart';
import 'package:nivo/generated/l10n.dart';

/// Typed authentication failure categories mapped from Firebase Auth errors.
enum AuthFailureType {
  invalidEmail,
  userNotFound,
  wrongPassword,
  invalidCredential,
  emailAlreadyInUse,
  weakPassword,
  userDisabled,
  tooManyRequests,
  networkError,
  notConfigured,
  unknown,
}

/// Domain exception representing a user-friendly authentication error.
class AuthFailure implements Exception {
  const AuthFailure(this.type);

  final AuthFailureType type;

  /// Maps a [FirebaseAuthException] to a typed [AuthFailure].
  factory AuthFailure.fromFirebaseException(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return const AuthFailure(AuthFailureType.invalidEmail);
      case 'user-not-found':
        return const AuthFailure(AuthFailureType.userNotFound);
      case 'wrong-password':
        return const AuthFailure(AuthFailureType.wrongPassword);
      case 'invalid-credential':
      case 'INVALID_LOGIN_CREDENTIALS':
        return const AuthFailure(AuthFailureType.invalidCredential);
      case 'email-already-in-use':
        return const AuthFailure(AuthFailureType.emailAlreadyInUse);
      case 'weak-password':
        return const AuthFailure(AuthFailureType.weakPassword);
      case 'user-disabled':
        return const AuthFailure(AuthFailureType.userDisabled);
      case 'too-many-requests':
        return const AuthFailure(AuthFailureType.tooManyRequests);
      case 'network-request-failed':
        return const AuthFailure(AuthFailureType.networkError);
      case 'no-app':
      case 'app-not-authorized':
        return const AuthFailure(AuthFailureType.notConfigured);
      default:
        return const AuthFailure(AuthFailureType.unknown);
    }
  }

  /// Resolves a localized, user-facing error message from [S].
  static String localize(AuthFailureType type, S s) {
    switch (type) {
      case AuthFailureType.invalidEmail:
        return s.authErrorInvalidEmail;
      case AuthFailureType.userNotFound:
        return s.authErrorUserNotFound;
      case AuthFailureType.wrongPassword:
        return s.authErrorWrongPassword;
      case AuthFailureType.invalidCredential:
        return s.authErrorInvalidCredential;
      case AuthFailureType.emailAlreadyInUse:
        return s.authErrorEmailInUse;
      case AuthFailureType.weakPassword:
        return s.authErrorWeakPassword;
      case AuthFailureType.userDisabled:
        return s.authErrorUserDisabled;
      case AuthFailureType.tooManyRequests:
        return s.authErrorTooManyRequests;
      case AuthFailureType.networkError:
        return s.authErrorNetwork;
      case AuthFailureType.notConfigured:
        return s.authErrorNotConfigured;
      case AuthFailureType.unknown:
        return s.authErrorUnknown;
    }
  }
}
