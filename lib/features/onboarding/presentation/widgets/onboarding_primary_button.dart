import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nivo/core/common/widgets/custom_button.dart';
import 'package:nivo/core/theme/app_texts/app_text_styles.dart';
import 'package:nivo/features/onboarding/presentation/animations/onboarding_motion_config.dart';
import 'package:nivo/features/onboarding/presentation/theme/onboarding_palette.dart';

/// Animated primary call-to-action button built atop Core [CustomButton].
class OnboardingPrimaryButton extends StatelessWidget {
  const OnboardingPrimaryButton({
    super.key,
    required this.label,
    required this.onTap,
    this.delay,
  });

  final String label;
  final VoidCallback onTap;
  final Duration? delay;

  @override
  Widget build(BuildContext context) {
    final palette = OnboardingPalette.of(context);
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return FadeInUp(
      from: 16,
      duration: OnboardingMotionConfig.ctaDuration,
      delay: delay ?? OnboardingMotionConfig.ctaDelay,
      curve: OnboardingMotionConfig.entranceCurve,
      child: CustomButton(
        text: label,
        onTap: onTap,
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
