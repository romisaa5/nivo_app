import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nivo/core/theme/app_texts/app_text_styles.dart';
import 'package:nivo/features/authentication/presentation/animations/auth_motion_config.dart';
import 'package:nivo/features/authentication/presentation/theme/auth_palette.dart';

/// Speech bubble with a directional tail pointing toward the Nivo mascot.
class AuthSpeechBubble extends StatelessWidget {
  const AuthSpeechBubble({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    final palette = AuthPalette.of(context);
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    final bubble = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomPaint(
          size: Size(9.w, 14.h),
          painter: _BubblePointerPainter(
            color: palette.speechBubbleBackground,
            pointsRight: isRtl,
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: palette.speechBubbleBackground,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: palette.speechBubbleBorder,
                width: 1.w,
              ),
            ),
            child: Text(
              message,
              textAlign: TextAlign.start,
              style: AppTextStyles.font14SemiBold.copyWith(
                color: palette.speechBubbleTextColor,
                height: 1.4,
                letterSpacing: isRtl ? 0 : null,
              ),
            ),
          ),
        ),
      ],
    );

    return isRtl
        ? FadeInRight(
            from: 16,
            duration: AuthMotionConfig.bubbleDuration,
            delay: AuthMotionConfig.bubbleDelay,
            curve: AuthMotionConfig.entranceCurve,
            child: bubble,
          )
        : FadeInLeft(
            from: 16,
            duration: AuthMotionConfig.bubbleDuration,
            delay: AuthMotionConfig.bubbleDelay,
            curve: AuthMotionConfig.entranceCurve,
            child: bubble,
          );
  }
}

class _BubblePointerPainter extends CustomPainter {
  const _BubblePointerPainter({
    required this.color,
    required this.pointsRight,
  });

  final Color color;
  final bool pointsRight;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    if (pointsRight) {
      // In RTL, the pointer is placed at the start (right edge) pointing right.
      path
        ..moveTo(size.width, size.height * 0.5)
        ..lineTo(0, 0)
        ..lineTo(0, size.height)
        ..close();
    } else {
      // In LTR, the pointer is placed at the start (left edge) pointing left.
      path
        ..moveTo(0, size.height * 0.5)
        ..lineTo(size.width, 0)
        ..lineTo(size.width, size.height)
        ..close();
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _BubblePointerPainter oldDelegate) {
    return oldDelegate.color != color || oldDelegate.pointsRight != pointsRight;
  }
}
