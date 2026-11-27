import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nivo/features/authentication/data/models/auth_user_model.dart';
import 'package:nivo/features/authentication/data/repositories/auth_repository.dart';
import 'package:nivo/features/authentication/data/services/auth_failure.dart';
import 'package:nivo/features/authentication/manager/states/auth_state.dart';

/// Cubit managing Firebase login, registration, and session lifecycle.
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authRepository) : super(const AuthInitial()) {
    _authSubscription = _authRepository.authStateChanges.listen((user) {
      if (isClosed) return;
      final hadUser = _currentUser != null;
      _currentUser = user;
      if (user == null && hadUser && !isBusy) {
        emit(const AuthSignedOut());
      }
    });
  }

  final AuthRepository _authRepository;
  StreamSubscription<AuthUserModel?>? _authSubscription;
  AuthUserModel? _currentUser;

  AuthUserModel? get currentUser => _currentUser ?? _authRepository.currentUser;

  bool get isBusy => state is AuthLoginLoading || state is AuthRegisterLoading;

  /// Restores any active Firebase Authentication session on app startup.
  Future<void> restoreSession() async {
    final user = await _authRepository.restoreSession();
    if (isClosed) return;
    _currentUser = user;
    if (user != null) {
      emit(AuthSessionRestored(user));
    }
  }

  /// Signs in with email and password via Firebase Authentication.
  Future<void> login({
    required String email,
    required String password,
  }) async {
    if (isBusy) return;
    emit(const AuthLoginLoading());
    try {
      final user = await _authRepository.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (isClosed) return;
      _currentUser = user;
      emit(AuthLoginSuccess(user));
    } on AuthFailure catch (failure) {
      if (isClosed) return;
      emit(AuthLoginError(failure.type));
    } catch (_) {
      if (isClosed) return;
      emit(const AuthLoginError(AuthFailureType.unknown));
    }
  }

  /// Registers a new user and updates their Firebase display name.
  Future<void> register({
    required String fullName,
    required String email,
    required String password,
  }) async {
    if (isBusy) return;
    emit(const AuthRegisterLoading());
    try {
      final user = await _authRepository.registerWithEmailAndPassword(
        fullName: fullName,
        email: email,
        password: password,
      );
      if (isClosed) return;
      _currentUser = user;
      emit(AuthRegisterSuccess(user));
    } on AuthFailure catch (failure) {
      if (isClosed) return;
      emit(AuthRegisterError(failure.type));
    } catch (_) {
      if (isClosed) return;
      emit(const AuthRegisterError(AuthFailureType.unknown));
    }
  }

  /// Retrieves a fresh Firebase ID token for the active user if signed in.
  Future<String?> getFreshIdToken({bool forceRefresh = false}) {
    return _authRepository.getFreshIdToken(forceRefresh: forceRefresh);
  }

  /// Signs out the current user and clears local session state.
  Future<void> signOut() async {
    await _authRepository.signOut();
    if (isClosed) return;
    _currentUser = null;
    emit(const AuthSignedOut());
  }

  @override
  Future<void> close() async {
    await _authSubscription?.cancel();
    return super.close();
  }
}
