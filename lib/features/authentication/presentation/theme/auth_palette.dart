import 'package:flutter/material.dart';
import 'package:nivo/core/theme/app_colors/custom_app_colors.dart';
import 'package:nivo/core/theme/theme_manager/theme_extensions.dart';

/// Theme-aware color palette for Login and Create Account screens.
///
/// Resolved exclusively from [CustomAppColors] via `context.customAppColors`
/// and `context.isDarkMode`.
class AuthPalette {
  const AuthPalette._({
    required this.scaffoldBackground,
    required this.ambientGlowTop,
    required this.ambientGlowBottom,
    required this.brandTextColor,
    required this.brandAvatarBackground,
    required this.brandAvatarBorder,
    required this.mascotGlowPrimary,
    required this.mascotGlowSecondary,
    required this.speechBubbleBackground,
    required this.speechBubbleBorder,
    required this.speechBubbleTextColor,
    required this.cardBackground,
    required this.cardBorder,
    required this.cardShadow,
    required this.titleColor,
    required this.subtitleColor,
    required this.fieldLabelColor,
    required this.fieldFillColor,
    required this.fieldBorderColor,
    required this.fieldFocusedBorderColor,
    required this.fieldErrorBorderColor,
    required this.fieldTextColor,
    required this.fieldHintColor,
    required this.fieldIconColor,
    required this.primaryButtonColor,
    required this.primaryButtonTextColor,
    required this.googleButtonBackground,
    required this.googleButtonBorder,
    required this.googleButtonTextColor,
    required this.footerPromptColor,
    required this.footerLinkColor,
  });

  final Color scaffoldBackground;
  final Color ambientGlowTop;
  final Color ambientGlowBottom;
  final Color brandTextColor;
  final Color brandAvatarBackground;
  final Color brandAvatarBorder;
  final Color mascotGlowPrimary;
  final Color mascotGlowSecondary;
  final Color speechBubbleBackground;
  final Color speechBubbleBorder;
  final Color speechBubbleTextColor;
  final Color cardBackground;
  final Color cardBorder;
  final Color cardShadow;
  final Color titleColor;
  final Color subtitleColor;
  final Color fieldLabelColor;
  final Color fieldFillColor;
  final Color fieldBorderColor;
  final Color fieldFocusedBorderColor;
  final Color fieldErrorBorderColor;
  final Color fieldTextColor;
  final Color fieldHintColor;
  final Color fieldIconColor;
  final Color primaryButtonColor;
  final Color primaryButtonTextColor;
  final Color googleButtonBackground;
  final Color googleButtonBorder;
  final Color googleButtonTextColor;
  final Color footerPromptColor;
  final Color footerLinkColor;

  factory AuthPalette.of(BuildContext context) {
    final CustomAppColors colors = context.customAppColors;
    final bool isDark = context.isDarkMode;

    return AuthPalette._(
      scaffoldBackground: isDark ? colors.primary900 : colors.background,
      ambientGlowTop: isDark
          ? colors.info900.withValues(alpha: 0.14)
          : colors.info300.withValues(alpha: 0.08),
      ambientGlowBottom: isDark
          ? colors.info300.withValues(alpha: 0.08)
          : colors.primary100.withValues(alpha: 0.22),
      brandTextColor: isDark ? colors.grey0 : colors.primary900,
      brandAvatarBackground: isDark
          ? Color.lerp(colors.primary800, colors.info900, 0.35)!
          : colors.grey0,
      brandAvatarBorder: isDark
          ? colors.info300.withValues(alpha: 0.45)
          : colors.grey100,
      mascotGlowPrimary: isDark
          ? colors.info700.withValues(alpha: 0.28)
          : colors.info300.withValues(alpha: 0.16),
      mascotGlowSecondary: isDark
          ? colors.info300.withValues(alpha: 0.14)
          : colors.info700.withValues(alpha: 0.08),
      speechBubbleBackground: isDark
          ? Color.lerp(colors.grey0, colors.info300, 0.13)!
          : Color.lerp(colors.info300, colors.grey0, 0.87)!,
      speechBubbleBorder: isDark
          ? colors.grey0.withValues(alpha: 0.18)
          : colors.info300.withValues(alpha: 0.30),
      speechBubbleTextColor: colors.primary900,
      cardBackground: isDark
          ? Color.lerp(colors.primary900, colors.info900, 0.24)!
          : colors.grey0,
      cardBorder: isDark
          ? Color.lerp(colors.primary700, colors.info300, 0.28)!
              .withValues(alpha: 0.45)
          : colors.grey100,
      cardShadow: isDark
          ? colors.black.withValues(alpha: 0.35)
          : colors.primary200.withValues(alpha: 0.22),
      titleColor: isDark ? colors.grey0 : colors.primary900,
      subtitleColor: isDark
          ? colors.primary100.withValues(alpha: 0.78)
          : colors.neutral600,
      fieldLabelColor: isDark
          ? colors.grey0.withValues(alpha: 0.92)
          : colors.primary800,
      fieldFillColor: isDark
          ? Color.lerp(colors.primary900, colors.info900, 0.10)!
          : colors.grey50,
      fieldBorderColor: isDark
          ? Color.lerp(colors.primary700, colors.info300, 0.22)!
              .withValues(alpha: 0.55)
          : colors.grey200,
      fieldFocusedBorderColor: colors.info300,
      fieldErrorBorderColor: colors.error500,
      fieldTextColor: isDark ? colors.grey0 : colors.primary900,
      fieldHintColor: isDark
          ? colors.primary200.withValues(alpha: 0.52)
          : colors.neutral500,
      fieldIconColor: isDark
          ? colors.primary200.withValues(alpha: 0.72)
          : colors.neutral600,
      primaryButtonColor: Color.lerp(colors.info300, colors.info900, 0.35)!,
      primaryButtonTextColor: colors.grey0,
      googleButtonBackground: isDark
          ? Color.lerp(colors.primary800, colors.info900, 0.35)!
          : colors.grey0,
      googleButtonBorder: isDark
          ? Color.lerp(colors.primary600, colors.info300, 0.25)!
              .withValues(alpha: 0.45)
          : colors.grey200,
      googleButtonTextColor: isDark ? colors.grey0 : colors.primary900,
      footerPromptColor: isDark
          ? colors.primary100.withValues(alpha: 0.72)
          : colors.neutral600,
      footerLinkColor: isDark
          ? Color.lerp(colors.info300, colors.grey0, 0.22)!
          : colors.info500,
    );
  }
}
