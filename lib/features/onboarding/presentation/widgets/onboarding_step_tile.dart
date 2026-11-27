import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nivo/core/helpers/extensions.dart';
import 'package:nivo/core/theme/app_texts/app_text_styles.dart';
import 'package:nivo/features/onboarding/data/models/onboarding_step_item.dart';
import 'package:nivo/features/onboarding/presentation/animations/onboarding_motion_config.dart';
import 'package:nivo/features/onboarding/presentation/theme/onboarding_palette.dart';
import 'package:nivo/features/onboarding/presentation/widgets/onboarding_experimental_badge.dart';

/// Rounded step container displayed in a staggered list on the workflow page.
class OnboardingStepTile extends StatelessWidget {
  const OnboardingStepTile({
    super.key,
    required this.item,
    required this.index,
  });

  final OnboardingStepItem item;
  final int index;

  @override
  Widget build(BuildContext context) {
    final palette = OnboardingPalette.of(context);
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final delay = OnboardingMotionConfig.staggeredDelay(index);

    final tile = Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 13.h),
      decoration: BoxDecoration(
        color: palette.stepTileBackground,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: palette.stepTileBorder,
          width: 1.w,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              item.text,
              textAlign: TextAlign.start,
              style: AppTextStyles.font14Medium.copyWith(
                color: palette.bodyColor,
                height: 1.45,
                letterSpacing: isRtl ? 0 : null,
              ),
            ),
          ),
          if (item.badgeText != null) ...[
            10.w.pw,
            OnboardingExperimentalBadge(label: item.badgeText!),
          ],
        ],
      ),
    );

    return isRtl
        ? FadeInRight(
            from: 18,
            duration: OnboardingMotionConfig.stepDuration,
            delay: delay,
            curve: OnboardingMotionConfig.entranceCurve,
            child: tile,
          )
        : FadeInLeft(
            from: 18,
            duration: OnboardingMotionConfig.stepDuration,
            delay: delay,
            curve: OnboardingMotionConfig.entranceCurve,
            child: tile,
          );
  }
}
