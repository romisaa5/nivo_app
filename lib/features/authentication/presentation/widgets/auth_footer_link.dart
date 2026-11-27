import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nivo/core/theme/app_texts/app_text_styles.dart';
import 'package:nivo/features/authentication/presentation/animations/auth_motion_config.dart';
import 'package:nivo/features/authentication/presentation/theme/auth_palette.dart';

/// Bottom footer row displaying a prompt and tappable navigation link between
/// Login and Create Account screens.
class AuthFooterLink extends StatelessWidget {
  const AuthFooterLink({
    super.key,
    required this.promptText,
    required this.linkText,
    required this.onTap,
  });

  final String promptText;
  final String linkText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final palette = AuthPalette.of(context);
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return FadeIn(
      duration: AuthMotionConfig.footerDuration,
      delay: AuthMotionConfig.footerDelay,
      curve: AuthMotionConfig.entranceCurve,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            promptText,
            style: AppTextStyles.font14Regular.copyWith(
              color: palette.footerPromptColor,
              letterSpacing: isRtl ? 0 : null,
            ),
          ),
          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(8.r),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              child: Text(
                linkText,
                style: AppTextStyles.font14SemiBold.copyWith(
                  color: palette.footerLinkColor,
                  letterSpacing: isRtl ? 0 : null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
