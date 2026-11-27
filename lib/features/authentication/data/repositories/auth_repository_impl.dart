import 'package:firebase_auth/firebase_auth.dart';
import 'package:nivo/core/helpers/secure_storage_helper.dart';
import 'package:nivo/core/helpers/shared_pref_helper.dart';
import 'package:nivo/core/utils/shared_pref_keys.dart';
import 'package:nivo/features/authentication/data/models/auth_user_model.dart';
import 'package:nivo/features/authentication/data/repositories/auth_repository.dart';
import 'package:nivo/features/authentication/data/services/firebase_auth_service.dart';

/// Repository coordinating Firebase Authentication and local session metadata.
///
/// Firebase Authentication remains the source of truth for the active session.
/// Non-sensitive metadata (`uid`, `email`, `displayName`) is cached via
/// [SharedPrefHelper], and the refreshable ID token is stored in
/// [SecureStorageHelper]. Passwords are never persisted.
class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(
    this._authService,
    this._secureStorageHelper,
  );

  final FirebaseAuthService _authService;
  final SecureStorageHelper _secureStorageHelper;

  @override
  Stream<AuthUserModel?> get authStateChanges {
    return _authService.authStateChanges.asyncMap((user) async {
      if (user == null) {
        await _clearLocalSession();
        return null;
      }
      final model = AuthUserModel.fromFirebaseUser(user);
      await _persistSession(user, model);
      return model;
    });
  }

  @override
  AuthUserModel? get currentUser {
    final user = _authService.currentUser;
    return user != null ? AuthUserModel.fromFirebaseUser(user) : null;
  }

  @override
  Future<AuthUserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final user = await _authService.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final model = AuthUserModel.fromFirebaseUser(user);
    await _persistSession(user, model);
    return model;
  }

  @override
  Future<AuthUserModel> registerWithEmailAndPassword({
    required String fullName,
    required String email,
    required String password,
  }) async {
    final user = await _authService.createUserWithEmailAndPassword(
      fullName: fullName,
      email: email,
      password: password,
    );
    final model = AuthUserModel.fromFirebaseUser(user);
    await _persistSession(user, model);
    return model;
  }

  @override
  Future<AuthUserModel?> restoreSession() async {
    final user = _authService.currentUser;
    if (user == null) {
      await _clearLocalSession();
      return null;
    }
    final model = AuthUserModel.fromFirebaseUser(user);
    await _persistSession(user, model);
    return model;
  }

  @override
  Future<String?> getFreshIdToken({bool forceRefresh = false}) async {
    final token = await _authService.getIdToken(forceRefresh: forceRefresh);
    if (token != null && token.isNotEmpty) {
      await _secureStorageHelper.saveToken(token);
    }
    return token;
  }

  @override
  Future<void> signOut() async {
    await _authService.signOut();
    await _clearLocalSession();
  }

  Future<void> _persistSession(User user, AuthUserModel model) async {
    await SharedPrefHelper.setData(
      key: SharedPrefKeys.isAuthenticated,
      value: true,
    );
    await SharedPrefHelper.setData(
      key: SharedPrefKeys.firebaseUid,
      value: model.uid,
    );
    await SharedPrefHelper.setData(
      key: SharedPrefKeys.userEmail,
      value: model.email,
    );
    if (model.displayName != null && model.displayName!.isNotEmpty) {
      await SharedPrefHelper.setData(
        key: SharedPrefKeys.userDisplayName,
        value: model.displayName!,
      );
    }
    final idToken = await user.getIdToken();
    if (idToken != null && idToken.isNotEmpty) {
      await _secureStorageHelper.saveToken(idToken);
    }
  }

  Future<void> _clearLocalSession() async {
    await SharedPrefHelper.setData(
      key: SharedPrefKeys.isAuthenticated,
      value: false,
    );
    await SharedPrefHelper.removeData(key: SharedPrefKeys.firebaseUid);
    await SharedPrefHelper.removeData(key: SharedPrefKeys.userEmail);
    await SharedPrefHelper.removeData(key: SharedPrefKeys.userDisplayName);
    await _secureStorageHelper.deleteToken();
  }
}
