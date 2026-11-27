import 'package:nivo/features/authentication/data/models/auth_user_model.dart';

/// Contract for Firebase authentication and local session management.
abstract class AuthRepository {
  Stream<AuthUserModel?> get authStateChanges;

  AuthUserModel? get currentUser;

  Future<AuthUserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<AuthUserModel> registerWithEmailAndPassword({
    required String fullName,
    required String email,
    required String password,
  });

  Future<AuthUserModel?> restoreSession();

  Future<String?> getFreshIdToken({bool forceRefresh = false});

  Future<void> signOut();
}
