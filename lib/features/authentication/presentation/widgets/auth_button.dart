import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nivo/core/common/widgets/custom_button.dart';
import 'package:nivo/core/theme/app_texts/app_text_styles.dart';
import 'package:nivo/features/authentication/presentation/animations/auth_motion_config.dart';
import 'package:nivo/features/authentication/presentation/theme/auth_palette.dart';

/// Animated primary submit button for authentication forms reusing Core
/// [CustomButton].
class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.label,
    required this.onTap,
    this.isLoading = false,
    this.animationIndex = 0,
  });

  final String label;
  final VoidCallback onTap;
  final bool isLoading;
  final int animationIndex;

  @override
  Widget build(BuildContext context) {
    final palette = AuthPalette.of(context);
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return FadeInUp(
      from: 14,
      duration: AuthMotionConfig.buttonDuration,
      delay: AuthMotionConfig.actionDelay(animationIndex),
      curve: AuthMotionConfig.entranceCurve,
      child: CustomButton(
        text: label,
        onTap: onTap,
        isLoading: isLoading,
        isborder: false,
        border: 28.r,
        hight: 50.h,
        color: palette.primaryButtonColor,
        textcolor: palette.primaryButtonTextColor,
        style: AppTextStyles.font16Bold.copyWith(
          color: palette.primaryButtonTextColor,
          letterSpacing: isRtl ? 0 : null,
        ),
      ),
    );
  }
}
