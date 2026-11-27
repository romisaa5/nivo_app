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
import 'package:nivo/features/authentication/presentation/widgets/create_account_form.dart';
import 'package:nivo/generated/l10n.dart';

/// Create Account screen assembling Nivo's branded header, registration form
/// card, and sign-in link.
class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

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
              if (state is AuthRegisterError) {
                AppSnackBar.showError(
                  context,
                  AuthFailure.localize(state.failure, s),
                );
              } else if (state is AuthRegisterSuccess) {
                AppSnackBar.showSuccess(context, s.authRegisterSuccessMessage);
              }
            },
            builder: (context, state) {
              final isLoading = state is AuthRegisterLoading;

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
                              AuthHeader(
                                bubbleMessage: s.authCreateAccountBubble,
                              ),
                              12.h.ph,
                              AuthCardContainer(
                                child: CreateAccountForm(
                                  isLoading: isLoading,
                                  onSubmit: (fullName, email, password) {
                                    context.read<AuthCubit>().register(
                                          fullName: fullName,
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
                              22.h.ph,
                              AuthFooterLink(
                                promptText: s.authHaveAccountPrompt,
                                linkText: s.authSignInLink,
                                onTap: () {
                                  if (isLoading) return;
                                  context.go(Routes.login);
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
