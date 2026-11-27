import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nivo/core/utils/app_images.dart';
import 'package:nivo/features/onboarding/presentation/animations/onboarding_motion_config.dart';
import 'package:nivo/features/onboarding/presentation/theme/onboarding_palette.dart';

/// Displays the Nivo robot mascot with a soft ambient glow and subtle
/// floating motion.
class OnboardingMascotHeader extends StatefulWidget {
  const OnboardingMascotHeader({
    super.key,
    this.size,
  });

  final double? size;

  @override
  State<OnboardingMascotHeader> createState() => _OnboardingMascotHeaderState();
}

class _OnboardingMascotHeaderState extends State<OnboardingMascotHeader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _floatController;
  late final Animation<double> _floatOffset;

  @override
  void initState() {
    super.initState();
    _floatController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2600),
    )..repeat(reverse: true);
    _floatOffset = Tween<double>(begin: -3.5, end: 3.5).animate(
      CurvedAnimation(parent: _floatController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _floatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final palette = OnboardingPalette.of(context);
    final mascotSize = widget.size ?? 148.w.clamp(120.0, 175.0);

    return ZoomIn(
      from: 0.84,
      duration: OnboardingMotionConfig.mascotDuration,
      delay: OnboardingMotionConfig.mascotDelay,
      curve: OnboardingMotionConfig.zoomCurve,
      child: SizedBox(
        width: mascotSize * 1.25,
        height: mascotSize * 1.05,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: mascotSize * 1.1,
              height: mascotSize * 1.1,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    palette.mascotGlowPrimary,
                    palette.mascotGlowSecondary,
                    palette.mascotGlowSecondary.withValues(alpha: 0),
                  ],
                  stops: const [0.0, 0.55, 1.0],
                ),
              ),
            ),
            Positioned(
              bottom: 4.h,
              child: Container(
                width: mascotSize * 0.72,
                height: 10.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.r),
                  boxShadow: [
                    BoxShadow(
                      color: palette.mascotBaseShadow,
                      blurRadius: 12.r,
                      spreadRadius: 1.r,
                    ),
                  ],
                ),
              ),
            ),
            AnimatedBuilder(
              animation: _floatOffset,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, _floatOffset.value),
                  child: child,
                );
              },
              child: Image.asset(
                AppImages.nivoMascot,
                width: mascotSize,
                height: mascotSize,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
