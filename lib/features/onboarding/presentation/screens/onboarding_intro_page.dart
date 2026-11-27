import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nivo/core/helpers/extensions.dart';
import 'package:nivo/features/onboarding/presentation/widgets/onboarding_card_container.dart';
import 'package:nivo/features/onboarding/presentation/widgets/onboarding_mascot_header.dart';
import 'package:nivo/features/onboarding/presentation/widgets/onboarding_page_indicator.dart';
import 'package:nivo/features/onboarding/presentation/widgets/onboarding_primary_button.dart';
import 'package:nivo/features/onboarding/presentation/widgets/onboarding_secondary_action.dart';
import 'package:nivo/features/onboarding/presentation/widgets/onboarding_subtitle_text.dart';
import 'package:nivo/features/onboarding/presentation/widgets/onboarding_title_text.dart';
import 'package:nivo/generated/l10n.dart';

/// First onboarding page introducing Nivo.
class OnboardingIntroPage extends StatelessWidget {
  const OnboardingIntroPage({
    super.key,
    required this.pageCount,
    required this.currentIndex,
    required this.onNext,
    required this.onHaveAccount,
    required this.onDotTap,
  });

  final int pageCount;
  final int currentIndex;
  final VoidCallback onNext;
  final VoidCallback onHaveAccount;
  final ValueChanged<int> onDotTap;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    return OnboardingCardContainer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          OnboardingMascotHeader(size: 150.w.clamp(124.0, 176.0)),
          18.h.ph,
          OnboardingTitleText(title: s.onboardingIntroTitle),
          8.h.ph,
          OnboardingSubtitleText(
            text: s.onboardingIntroSubtitle,
            textAlign: TextAlign.center,
          ),
          26.h.ph,
          OnboardingPrimaryButton(
            label: s.onboardingIntroButton,
            onTap: onNext,
          ),
          14.h.ph,
          OnboardingSecondaryAction(
            label: s.onboardingHaveAccount,
            onTap: onHaveAccount,
          ),
          16.h.ph,
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
