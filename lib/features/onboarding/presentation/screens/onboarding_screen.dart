import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:nivo/core/helpers/shared_pref_helper.dart';
import 'package:nivo/core/routing/routes.dart';
import 'package:nivo/core/theme/theme_manager/theme_extensions.dart';
import 'package:nivo/core/utils/shared_pref_keys.dart';
import 'package:nivo/features/onboarding/presentation/animations/onboarding_motion_config.dart';
import 'package:nivo/features/onboarding/presentation/screens/onboarding_intro_page.dart';
import 'package:nivo/features/onboarding/presentation/screens/onboarding_story_page.dart';
import 'package:nivo/features/onboarding/presentation/screens/onboarding_workflow_page.dart';
import 'package:nivo/features/onboarding/presentation/widgets/onboarding_background.dart';

/// Main onboarding coordinator managing page transitions and onboarding
/// completion state.
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({
    super.key,
    this.onCompleted,
    this.onHaveAccount,
  });

  final VoidCallback? onCompleted;
  final VoidCallback? onHaveAccount;

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  static const int _pageCount = 3;

  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _animateToPage(int index) {
    if (index < 0 || index >= _pageCount || index == _currentPage) return;
    _pageController.animateToPage(
      index,
      duration: OnboardingMotionConfig.pageTransitionDuration,
      curve: OnboardingMotionConfig.pageCurve,
    );
  }

  void _goToNextPage() {
    if (_currentPage < _pageCount - 1) {
      _animateToPage(_currentPage + 1);
    }
  }

  Future<void> _handleGetStarted() async {
    await SharedPrefHelper.setData(
      key: SharedPrefKeys.onboardingCompleted,
      value: true,
    );
    if (!mounted) return;
    if (widget.onCompleted != null) {
      widget.onCompleted!();
      return;
    }
    context.go(Routes.createAccount);
  }

  Future<void> _handleHaveAccount() async {
    await SharedPrefHelper.setData(
      key: SharedPrefKeys.onboardingCompleted,
      value: true,
    );
    if (!mounted) return;
    if (widget.onHaveAccount != null) {
      widget.onHaveAccount!();
      return;
    }
    context.go(Routes.login);
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return OnboardingIntroPage(
          key: const ValueKey('onboarding_intro_page'),
          pageCount: _pageCount,
          currentIndex: 0,
          onNext: _goToNextPage,
          onHaveAccount: _handleHaveAccount,
          onDotTap: _animateToPage,
        );
      case 1:
        return OnboardingStoryPage(
          key: const ValueKey('onboarding_story_page'),
          pageCount: _pageCount,
          currentIndex: 1,
          onNext: _goToNextPage,
          onDotTap: _animateToPage,
        );
      default:
        return OnboardingWorkflowPage(
          key: const ValueKey('onboarding_workflow_page'),
          pageCount: _pageCount,
          currentIndex: 2,
          onGetStarted: _handleGetStarted,
          onHaveAccount: _handleHaveAccount,
          onDotTap: _animateToPage,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final overlayStyle = context.isDarkMode
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overlayStyle,
      child: Scaffold(
        body: OnboardingBackground(
          child: PageView.builder(
            controller: _pageController,
            itemCount: _pageCount,
            physics: const BouncingScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) => _buildPage(index),
          ),
        ),
      ),
    );
  }
}
