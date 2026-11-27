import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nivo/core/theme/app_texts/app_text_styles.dart';
import 'package:nivo/features/onboarding/presentation/animations/onboarding_motion_config.dart';
import 'package:nivo/features/onboarding/presentation/theme/onboarding_palette.dart';

/// Animated body / subtitle text supporting both centered and start-aligned
/// paragraphs across LTR and RTL locales.
class OnboardingSubtitleText extends StatelessWidget {
  const OnboardingSubtitleText({
    super.key,
    required this.text,
    this.textAlign = TextAlign.center,
    this.delay,
    this.fontSize,
  });

  final String text;
  final TextAlign textAlign;
  final Duration? delay;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    final palette = OnboardingPalette.of(context);
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return FadeInUp(
      from: 14,
      duration: OnboardingMotionConfig.bodyDuration,
      delay: delay ?? OnboardingMotionConfig.bodyDelay,
      curve: OnboardingMotionConfig.entranceCurve,
      child: Text(
        text,
        textAlign: textAlign,
        style: AppTextStyles.font14Regular.copyWith(
          fontSize: fontSize ?? 14.5.sp,
          color: palette.bodyColor,
          height: 1.65,
          letterSpacing: isRtl ? 0 : null,
        ),
      ),
    );
  }
}
