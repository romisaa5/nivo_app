import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nivo/features/authentication/presentation/animations/auth_motion_config.dart';
import 'package:nivo/features/authentication/presentation/theme/auth_palette.dart';

/// Rounded card container holding the authentication form content.
class AuthCardContainer extends StatelessWidget {
  const AuthCardContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final palette = AuthPalette.of(context);

    return FadeInUp(
      from: 18,
      duration: AuthMotionConfig.cardDuration,
      curve: AuthMotionConfig.entranceCurve,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
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
    );
  }
}
