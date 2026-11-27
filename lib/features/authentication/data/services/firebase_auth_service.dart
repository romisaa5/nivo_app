import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';
import 'package:nivo/core/helpers/app_logger.dart';
import 'package:nivo/features/authentication/data/services/auth_failure.dart';

/// Thin wrapper around [FirebaseAuth.instance] ensuring safe Firebase checks
/// and clean separation from UI and state management.
class FirebaseAuthService {
  const FirebaseAuthService();

  bool get isFirebaseReady => Firebase.apps.isNotEmpty;

  FirebaseAuth get _auth {
    if (!isFirebaseReady) {
      throw const AuthFailure(AuthFailureType.notConfigured);
    }
    return FirebaseAuth.instance;
  }

  User? get currentUser => isFirebaseReady ? _auth.currentUser : null;

  Stream<User?> get authStateChanges {
    if (!isFirebaseReady) {
      return const Stream<User?>.empty();
    }
    return _auth.authStateChanges();
  }

  Future<void> _syncAuthLanguage(FirebaseAuth auth) async {
    try {
      final locale = Intl.getCurrentLocale();
      final languageCode = locale.isNotEmpty ? locale.split('_').first : null;
      await auth.setLanguageCode(languageCode);
    } catch (_) {
      // Non-critical locale header sync; proceed with request.
    }
  }

  /// Signs in an existing user via [FirebaseAuth.instance.signInWithEmailAndPassword].
  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final auth = _auth;
      await _syncAuthLanguage(auth);
      final credential = await auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      final user = credential.user;
      if (user == null) {
        throw const AuthFailure(AuthFailureType.unknown);
      }
      return user;
    } on FirebaseAuthException catch (e) {
      AppLogger.log(
        'FirebaseAuth login error [code=${e.code}]: ${e.message}',
        name: 'AUTH',
      );
      throw AuthFailure.fromFirebaseException(e);
    } on AuthFailure {
      rethrow;
    } catch (e) {
      AppLogger.log('Unexpected login error: $e', name: 'AUTH');
      throw const AuthFailure(AuthFailureType.unknown);
    }
  }

  /// Creates a new Firebase user and updates their profile display name.
  Future<User> createUserWithEmailAndPassword({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      final auth = _auth;
      await _syncAuthLanguage(auth);
      final credential = await auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      final user = credential.user;
      if (user == null) {
        throw const AuthFailure(AuthFailureType.unknown);
      }
      final trimmedName = fullName.trim();
      if (trimmedName.isNotEmpty) {
        await user.updateDisplayName(trimmedName);
        await user.reload();
      }
      return auth.currentUser ?? user;
    } on FirebaseAuthException catch (e) {
      AppLogger.log(
        'FirebaseAuth register error [code=${e.code}]: ${e.message}',
        name: 'AUTH',
      );
      throw AuthFailure.fromFirebaseException(e);
    } on AuthFailure {
      rethrow;
    } catch (e) {
      AppLogger.log('Unexpected register error: $e', name: 'AUTH');
      throw const AuthFailure(AuthFailureType.unknown);
    }
  }

  /// Retrieves the current Firebase ID token, optionally forcing a refresh.
  Future<String?> getIdToken({bool forceRefresh = false}) async {
    final user = currentUser;
    if (user == null) return null;
    try {
      return await user.getIdToken(forceRefresh);
    } on FirebaseAuthException catch (e) {
      AppLogger.log(
        'FirebaseAuth token error [code=${e.code}]: ${e.message}',
        name: 'AUTH',
      );
      return null;
    }
  }

  /// Signs out from Firebase Authentication.
  Future<void> signOut() async {
    if (!isFirebaseReady) return;
    await _auth.signOut();
  }
}
