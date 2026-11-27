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

/// Form widget handling Create Account input validation, password visibility
/// toggle, and registration submission callbacks.
class CreateAccountForm extends StatefulWidget {
  const CreateAccountForm({
    super.key,
    required this.isLoading,
    required this.onSubmit,
    required this.onGoogleTap,
  });

  final bool isLoading;
  final void Function(String fullName, String email, String password) onSubmit;
  final VoidCallback onGoogleTap;

  @override
  State<CreateAccountForm> createState() => _CreateAccountFormState();
}

class _CreateAccountFormState extends State<CreateAccountForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordObscured = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (widget.isLoading) return;
    if (_formKey.currentState?.validate() ?? false) {
      FocusScope.of(context).unfocus();
      widget.onSubmit(
        _nameController.text.trim(),
        _emailController.text.trim(),
        _passwordController.text,
      );
    }
  }

  String? _validateName(String? value, S s) {
    final trimmed = value?.trim() ?? '';
    if (trimmed.isEmpty) {
      return s.authNameRequiredError;
    }
    if (trimmed.length < 2) {
      return s.authNameLengthError;
    }
    return null;
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
    if (value.length < 6) {
      return s.authPasswordMinLengthError;
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
            title: s.authCreateAccountTitle,
            subtitle: s.authCreateAccountSubtitle,
          ),
          18.h.ph,
          AuthTextField(
            label: s.authFullNameLabel,
            hintText: s.authFullNameHint,
            controller: _nameController,
            animationIndex: 0,
            keyboardType: TextInputType.name,
            validator: (value) => _validateName(value, s),
          ),
          14.h.ph,
          AuthTextField(
            label: s.authEmailLabel,
            hintText: s.authCreateEmailHint,
            controller: _emailController,
            animationIndex: 1,
            keyboardType: TextInputType.emailAddress,
            validator: (value) => _validateEmail(value, s),
          ),
          14.h.ph,
          AuthTextField(
            label: s.authPasswordLabel,
            hintText: s.authPasswordHint,
            controller: _passwordController,
            animationIndex: 2,
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
            label: s.authCreateAccountButton,
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
