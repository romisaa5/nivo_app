import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nivo/core/helpers/extensions.dart';
import 'package:nivo/features/onboarding/presentation/animations/onboarding_motion_config.dart';
import 'package:nivo/features/onboarding/presentation/widgets/onboarding_card_container.dart';
import 'package:nivo/features/onboarding/presentation/widgets/onboarding_mascot_header.dart';
import 'package:nivo/features/onboarding/presentation/widgets/onboarding_page_indicator.dart';
import 'package:nivo/features/onboarding/presentation/widgets/onboarding_primary_button.dart';
import 'package:nivo/features/onboarding/presentation/widgets/onboarding_subtitle_text.dart';
import 'package:nivo/features/onboarding/presentation/widgets/onboarding_title_text.dart';
import 'package:nivo/generated/l10n.dart';

/// Second onboarding page sharing Nivo's origin story.
class OnboardingStoryPage extends StatelessWidget {
  const OnboardingStoryPage({
    super.key,
    required this.pageCount,
    required this.currentIndex,
    required this.onNext,
    required this.onDotTap,
  });

  final int pageCount;
  final int currentIndex;
  final VoidCallback onNext;
  final ValueChanged<int> onDotTap;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final paragraphs = [
      s.onboardingStoryParagraph1,
      s.onboardingStoryParagraph2,
      s.onboardingStoryParagraph3,
    ];

    return OnboardingCardContainer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          OnboardingMascotHeader(size: 142.w.clamp(118.0, 168.0)),
          14.h.ph,
          OnboardingTitleText(title: s.onboardingStoryTitle),
          16.h.ph,
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (int i = 0; i < paragraphs.length; i++) ...[
                  OnboardingSubtitleText(
                    text: paragraphs[i],
                    textAlign: TextAlign.start,
                    delay: OnboardingMotionConfig.staggeredDelay(
                      i,
                      baseMs: 200,
                      stepMs: 80,
                    ),
                  ),
                  if (i < paragraphs.length - 1) 14.h.ph,
                ],
              ],
            ),
          ),
          24.h.ph,
          OnboardingPrimaryButton(
            label: s.onboardingStoryButton,
            onTap: onNext,
            delay: OnboardingMotionConfig.workflowCtaDelay,
          ),
          18.h.ph,
          OnboardingPageIndicator(
            pageCount: pageCount,
            currentIndex: currentIndex,
            onDotTap: onDotTap,
          ),
        ],
      ),
    );
  }
}
