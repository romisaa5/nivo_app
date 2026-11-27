import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nivo/core/helpers/extensions.dart';
import 'package:nivo/core/theme/app_texts/app_text_styles.dart';
import 'package:nivo/features/authentication/presentation/animations/auth_motion_config.dart';
import 'package:nivo/features/authentication/presentation/theme/auth_palette.dart';

/// Card section title and subtitle displayed at the top of an auth form.
class AuthSectionHeader extends StatelessWidget {
  const AuthSectionHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final palette = AuthPalette.of(context);
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return FadeInUp(
      from: 12,
      duration: AuthMotionConfig.fieldDuration,
      delay: AuthMotionConfig.sectionHeaderDelay,
      curve: AuthMotionConfig.entranceCurve,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            textAlign: TextAlign.start,
            style: AppTextStyles.font20Bold.copyWith(
              fontSize: 21.sp,
              color: palette.titleColor,
              letterSpacing: isRtl ? 0 : null,
            ),
          ),
          6.h.ph,
          Text(
            subtitle,
            textAlign: TextAlign.start,
            style: AppTextStyles.font13Regular.copyWith(
              color: palette.subtitleColor,
              height: 1.5,
              letterSpacing: isRtl ? 0 : null,
            ),
          ),
        ],
      ),
    );
  }
}
