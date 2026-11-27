import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nivo/core/common/widgets/custom_button.dart';
import 'package:nivo/core/theme/app_texts/app_text_styles.dart';
import 'package:nivo/core/utils/app_icons.dart';
import 'package:nivo/features/authentication/presentation/animations/auth_motion_config.dart';
import 'package:nivo/features/authentication/presentation/theme/auth_palette.dart';
import 'package:nivo/generated/l10n.dart';

/// Social authentication actions (Google beta pill button) reusing Core
/// [CustomButton].
class SocialAuthButtons extends StatelessWidget {
  const SocialAuthButtons({
    super.key,
    required this.onGoogleTap,
    this.isDisabled = false,
    this.animationIndex = 1,
  });

  final VoidCallback onGoogleTap;
  final bool isDisabled;
  final int animationIndex;

  @override
  Widget build(BuildContext context) {
    final palette = AuthPalette.of(context);
    final s = S.of(context);
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return FadeInUp(
      from: 14,
      duration: AuthMotionConfig.buttonDuration,
      delay: AuthMotionConfig.actionDelay(animationIndex),
      curve: AuthMotionConfig.entranceCurve,
      child: Opacity(
        opacity: isDisabled ? 0.65 : 1.0,
        child: CustomButton(
          text: s.authGoogleBetaButton,
          onTap: isDisabled ? null : onGoogleTap,
          isIcon: true,
          icon: AppIcons.googleIcon,
          isborder: true,
          border: 28.r,
          hight: 50.h,
          color: palette.googleButtonBackground,
          borderColor: palette.googleButtonBorder,
          textcolor: palette.googleButtonTextColor,
          style: AppTextStyles.font14SemiBold.copyWith(
            color: palette.googleButtonTextColor,
            letterSpacing: isRtl ? 0 : null,
          ),
        ),
      ),
    );
  }
}
