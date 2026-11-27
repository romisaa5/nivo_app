import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nivo/core/helpers/extensions.dart';
import 'package:nivo/core/theme/app_texts/app_text_styles.dart';
import 'package:nivo/core/utils/app_images.dart';
import 'package:nivo/features/authentication/presentation/animations/auth_motion_config.dart';
import 'package:nivo/features/authentication/presentation/theme/auth_palette.dart';
import 'package:nivo/features/authentication/presentation/widgets/auth_speech_bubble.dart';
import 'package:nivo/generated/l10n.dart';

/// Top brand header featuring the NIVO emblem, mascot, and contextual speech
/// bubble.
class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    required this.bubbleMessage,
  });

  final String bubbleMessage;

  @override
  Widget build(BuildContext context) {
    final palette = AuthPalette.of(context);
    final s = S.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FadeInDown(
          from: 10,
          duration: AuthMotionConfig.brandDuration,
          delay: AuthMotionConfig.brandDelay,
          curve: AuthMotionConfig.entranceCurve,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 34.w,
                height: 34.w,
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: palette.brandAvatarBackground,
                  border: Border.all(
                    color: palette.brandAvatarBorder,
                    width: 1.w,
                  ),
                ),
                child: Image.asset(
                  AppImages.nivoMascot,
                  fit: BoxFit.contain,
                ),
              ),
              8.w.pw,
              Text(
                s.authBrandName,
                style: AppTextStyles.font18Bold.copyWith(
                  color: palette.brandTextColor,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
        10.h.ph,
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ZoomIn(
              from: 0.85,
              duration: AuthMotionConfig.mascotDuration,
              delay: AuthMotionConfig.mascotDelay,
              curve: AuthMotionConfig.zoomCurve,
              child: SizedBox(
                width: 92.w.clamp(82.0, 108.0),
                height: 92.w.clamp(82.0, 108.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 86.w.clamp(76.0, 100.0),
                      height: 86.w.clamp(76.0, 100.0),
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
                    Image.asset(
                      AppImages.nivoMascot,
                      width: 88.w.clamp(78.0, 102.0),
                      height: 88.w.clamp(78.0, 102.0),
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
            ),
            6.w.pw,
            Expanded(
              child: AuthSpeechBubble(message: bubbleMessage),
            ),
          ],
        ),
      ],
    );
  }
}
