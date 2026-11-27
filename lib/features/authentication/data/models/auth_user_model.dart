import 'package:firebase_auth/firebase_auth.dart';

/// Immutable representation of an authenticated Firebase user.
///
/// Never stores passwords or sensitive credential secrets.
class AuthUserModel {
  const AuthUserModel({
    required this.uid,
    required this.email,
    required this.displayName,
    required this.emailVerified,
  });

  final String uid;
  final String email;
  final String? displayName;
  final bool emailVerified;

  factory AuthUserModel.fromFirebaseUser(User user) {
    return AuthUserModel(
      uid: user.uid,
      email: user.email ?? '',
      displayName: user.displayName,
      emailVerified: user.emailVerified,
    );
  }
}
