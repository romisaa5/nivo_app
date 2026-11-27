import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nivo/features/authentication/presentation/theme/auth_palette.dart';

/// Ambient background canvas matching the Nivo dark/light theme aesthetics.
class AuthBackground extends StatelessWidget {
  const AuthBackground({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final palette = AuthPalette.of(context);

    return ColoredBox(
      color: palette.scaffoldBackground,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: -120.h,
            left: -80.w,
            child: IgnorePointer(
              child: Container(
                width: 300.w,
                height: 300.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      palette.ambientGlowTop,
                      palette.ambientGlowTop.withValues(alpha: 0),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -140.h,
            right: -90.w,
            child: IgnorePointer(
              child: Container(
                width: 320.w,
                height: 320.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      palette.ambientGlowBottom,
                      palette.ambientGlowBottom.withValues(alpha: 0),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SafeArea(child: child),
        ],
      ),
    );
  }
}
