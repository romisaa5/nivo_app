import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nivo/features/onboarding/presentation/theme/onboarding_palette.dart';

/// Responsive centered card shell wrapping each onboarding page's content.
class OnboardingCardContainer extends StatelessWidget {
  const OnboardingCardContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  double _resolveMaxWidth(double viewportWidth) {
    if (viewportWidth >= 1024) return 480;
    if (viewportWidth >= 600) return 440;
    return double.infinity;
  }

  @override
  Widget build(BuildContext context) {
    final palette = OnboardingPalette.of(context);
    final viewportWidth = MediaQuery.sizeOf(context).width;
    final horizontalMargin = viewportWidth >= 600 ? 24.0 : 16.w;

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: horizontalMargin,
            vertical: 20.h,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight:
                  (constraints.maxHeight - 40.h).clamp(0.0, double.infinity),
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: _resolveMaxWidth(viewportWidth),
                ),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 28.h,
                  ),
                  decoration: BoxDecoration(
                    color: palette.cardBackground,
                    borderRadius: BorderRadius.circular(24.r),
                    border: Border.all(
                      color: palette.cardBorder,
                      width: 1.w,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: palette.cardShadow,
                        blurRadius: 28.r,
                        offset: Offset(0, 14.h),
                      ),
                    ],
                  ),
                  child: child,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
