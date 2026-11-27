import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nivo/core/helpers/extensions.dart';
import 'package:nivo/features/onboarding/data/models/onboarding_step_item.dart';
import 'package:nivo/features/onboarding/presentation/animations/onboarding_motion_config.dart';
import 'package:nivo/features/onboarding/presentation/widgets/onboarding_card_container.dart';
import 'package:nivo/features/onboarding/presentation/widgets/onboarding_mascot_header.dart';
import 'package:nivo/features/onboarding/presentation/widgets/onboarding_page_indicator.dart';
import 'package:nivo/features/onboarding/presentation/widgets/onboarding_primary_button.dart';
import 'package:nivo/features/onboarding/presentation/widgets/onboarding_secondary_action.dart';
import 'package:nivo/features/onboarding/presentation/widgets/onboarding_step_tile.dart';
import 'package:nivo/features/onboarding/presentation/widgets/onboarding_title_text.dart';
import 'package:nivo/generated/l10n.dart';

/// Third onboarding page outlining the 3-step focus workflow with Nivo.
class OnboardingWorkflowPage extends StatelessWidget {
  const OnboardingWorkflowPage({
    super.key,
    required this.pageCount,
    required this.currentIndex,
    required this.onGetStarted,
    required this.onHaveAccount,
    required this.onDotTap,
  });

  final int pageCount;
  final int currentIndex;
  final VoidCallback onGetStarted;
  final VoidCallback onHaveAccount;
  final ValueChanged<int> onDotTap;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final steps = [
      OnboardingStepItem(
        text: s.onboardingWorkflowStep1,
        badgeText: s.onboardingWorkflowStep1Badge,
      ),
      OnboardingStepItem(text: s.onboardingWorkflowStep2),
      OnboardingStepItem(text: s.onboardingWorkflowStep3),
    ];

    return OnboardingCardContainer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          OnboardingMascotHeader(size: 142.w.clamp(118.0, 168.0)),
          14.h.ph,
          OnboardingTitleText(title: s.onboardingWorkflowTitle),
          18.h.ph,
          for (int i = 0; i < steps.length; i++) ...[
            OnboardingStepTile(item: steps[i], index: i),
            if (i < steps.length - 1) 10.h.ph,
          ],
          24.h.ph,
          OnboardingPrimaryButton(
            label: s.onboardingWorkflowButton,
            onTap: onGetStarted,
            delay: OnboardingMotionConfig.workflowCtaDelay,
          ),
          14.h.ph,
          OnboardingSecondaryAction(
            label: s.onboardingHaveAccount,
            onTap: onHaveAccount,
            delay: OnboardingMotionConfig.workflowSecondaryActionDelay,
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
