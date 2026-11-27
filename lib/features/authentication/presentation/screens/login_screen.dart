import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nivo/core/helpers/app_snackbar.dart';
import 'package:nivo/core/helpers/extensions.dart';
import 'package:nivo/core/routing/routes.dart';
import 'package:nivo/core/theme/theme_manager/theme_extensions.dart';
import 'package:nivo/features/authentication/data/services/auth_failure.dart';
import 'package:nivo/features/authentication/manager/cubit/auth_cubit.dart';
import 'package:nivo/features/authentication/manager/states/auth_state.dart';
import 'package:nivo/features/authentication/presentation/widgets/auth_background.dart';
import 'package:nivo/features/authentication/presentation/widgets/auth_card_container.dart';
import 'package:nivo/features/authentication/presentation/widgets/auth_footer_link.dart';
import 'package:nivo/features/authentication/presentation/widgets/auth_header.dart';
import 'package:nivo/features/authentication/presentation/widgets/login_form.dart';
import 'package:nivo/generated/l10n.dart';

/// Login screen assembling Nivo's branded header, login form card, and
/// account-creation link.
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  double _resolveMaxWidth(double viewportWidth) {
    if (viewportWidth >= 1024) return 480;
    if (viewportWidth >= 600) return 440;
    return double.infinity;
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final viewportWidth = MediaQuery.sizeOf(context).width;
    final horizontalPadding = viewportWidth >= 600 ? 24.0 : 16.w;
    final overlayStyle = context.isDarkMode
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overlayStyle,
      child: Scaffold(
        body: AuthBackground(
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthLoginError) {
                AppSnackBar.showError(
                  context,
                  AuthFailure.localize(state.failure, s),
                );
              } else if (state is AuthLoginSuccess) {
                final name = state.user.displayName?.trim() ?? '';
                final message = name.isNotEmpty
                    ? s.authLoginSuccessMessage(name)
                    : s.authLoginSuccessFallback;
                AppSnackBar.showSuccess(context, message);
              }
            },
            builder: (context, state) {
              final isLoading = state is AuthLoginLoading;

              return LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
                      vertical: 16.h,
                    ),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: (constraints.maxHeight - 32.h)
                            .clamp(0.0, double.infinity),
                      ),
                      child: Center(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: _resolveMaxWidth(viewportWidth),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              AuthHeader(bubbleMessage: s.authLoginBubble),
                              12.h.ph,
                              AuthCardContainer(
                                child: LoginForm(
                                  isLoading: isLoading,
                                  onSubmit: (email, password) {
                                    context.read<AuthCubit>().login(
                                          email: email,
                                          password: password,
                                        );
                                  },
                                  onGoogleTap: () {
                                    AppSnackBar.showInfo(
                                      context,
                                      s.authGoogleBetaUnavailable,
                                    );
                                  },
                                ),
                              ),
                              24.h.ph,
                              AuthFooterLink(
                                promptText: s.authFirstTimePrompt,
                                linkText: s.authCreateAccountLink,
                                onTap: () {
                                  if (isLoading) return;
                                  context.go(Routes.createAccount);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
