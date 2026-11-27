import 'package:nivo/features/authentication/data/models/auth_user_model.dart';
import 'package:nivo/features/authentication/data/services/auth_failure.dart';

/// Base state for authentication flows managed by [AuthCubit].
sealed class AuthState {
  const AuthState();
}

final class AuthInitial extends AuthState {
  const AuthInitial();
}

final class AuthSessionRestored extends AuthState {
  const AuthSessionRestored(this.user);

  final AuthUserModel user;
}

final class AuthLoginLoading extends AuthState {
  const AuthLoginLoading();
}

final class AuthLoginSuccess extends AuthState {
  const AuthLoginSuccess(this.user);

  final AuthUserModel user;
}

final class AuthLoginError extends AuthState {
  const AuthLoginError(this.failure);

  final AuthFailureType failure;
}

final class AuthRegisterLoading extends AuthState {
  const AuthRegisterLoading();
}

final class AuthRegisterSuccess extends AuthState {
  const AuthRegisterSuccess(this.user);

  final AuthUserModel user;
}

final class AuthRegisterError extends AuthState {
  const AuthRegisterError(this.failure);

  final AuthFailureType failure;
}

final class AuthSignedOut extends AuthState {
  const AuthSignedOut();
}
