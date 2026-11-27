import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nivo/core/helpers/app_regex.dart';
import 'package:nivo/core/helpers/extensions.dart';
import 'package:nivo/features/authentication/presentation/widgets/auth_button.dart';
import 'package:nivo/features/authentication/presentation/widgets/auth_divider.dart';
import 'package:nivo/features/authentication/presentation/widgets/auth_section_header.dart';
import 'package:nivo/features/authentication/presentation/widgets/auth_text_field.dart';
import 'package:nivo/features/authentication/presentation/widgets/password_visibility_button.dart';
import 'package:nivo/features/authentication/presentation/widgets/social_auth_buttons.dart';
import 'package:nivo/generated/l10n.dart';

/// Form widget handling Login input validation, password visibility toggle,
/// and submission callbacks.
class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    required this.isLoading,
    required this.onSubmit,
    required this.onGoogleTap,
  });

  final bool isLoading;
  final void Function(String email, String password) onSubmit;
  final VoidCallback onGoogleTap;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordObscured = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (widget.isLoading) return;
    if (_formKey.currentState?.validate() ?? false) {
      FocusScope.of(context).unfocus();
      widget.onSubmit(
        _emailController.text.trim(),
        _passwordController.text,
      );
    }
  }

  String? _validateEmail(String? value, S s) {
    final trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) {
      return s.authEmailRequiredError;
    }
    if (!AppRegex.isEmailValid(trimmed)) {
      return s.authEmailInvalidError;
    }
    return null;
  }

  String? _validatePassword(String? value, S s) {
    if (value == null || value.isEmpty) {
      return s.authPasswordRequiredError;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AuthSectionHeader(
            title: s.authLoginTitle,
            subtitle: s.authLoginSubtitle,
          ),
          20.h.ph,
          AuthTextField(
            label: s.authEmailLabel,
            hintText: s.authLoginEmailHint,
            controller: _emailController,
            animationIndex: 0,
            keyboardType: TextInputType.emailAddress,
            validator: (value) => _validateEmail(value, s),
          ),
          16.h.ph,
          AuthTextField(
            label: s.authPasswordLabel,
            hintText: s.authPasswordHint,
            controller: _passwordController,
            animationIndex: 1,
            isObscured: _isPasswordObscured,
            keyboardType: TextInputType.visiblePassword,
            validator: (value) => _validatePassword(value, s),
            suffixIcon: PasswordVisibilityButton(
              isObscured: _isPasswordObscured,
              onToggle: () {
                setState(() {
                  _isPasswordObscured = !_isPasswordObscured;
                });
              },
            ),
          ),
          22.h.ph,
          AuthButton(
            label: s.authLoginButton,
            onTap: _submit,
            isLoading: widget.isLoading,
            animationIndex: 0,
          ),
          const AuthDivider(),
          SocialAuthButtons(
            onGoogleTap: widget.onGoogleTap,
            isDisabled: widget.isLoading,
            animationIndex: 1,
          ),
        ],
      ),
    );
  }
}
