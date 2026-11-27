import 'package:flutter/material.dart';
import 'package:nivo/core/theme/app_colors/custom_app_colors.dart';
import 'package:nivo/core/theme/theme_manager/theme_extensions.dart';

/// Theme-aware color palette for the Onboarding flow.
///
/// All colors are resolved exclusively from [CustomAppColors] and the active
/// brightness mode via `context.customAppColors` and `context.isDarkMode`.
class OnboardingPalette {
  const OnboardingPalette._({
    required this.scaffoldBackground,
    required this.ambientGlowTop,
    required this.ambientGlowBottom,
    required this.cardBackground,
    required this.cardBorder,
    required this.cardShadow,
    required this.mascotGlowPrimary,
    required this.mascotGlowSecondary,
    required this.mascotBaseShadow,
    required this.titleColor,
    required this.bodyColor,
    required this.secondaryActionColor,
    required this.primaryButtonColor,
    required this.primaryButtonTextColor,
    required this.stepTileBackground,
    required this.stepTileBorder,
    required this.badgeBackground,
    required this.badgeBorder,
    required this.badgeTextColor,
    required this.activeIndicatorColor,
    required this.inactiveIndicatorColor,
  });

  final Color scaffoldBackground;
  final Color ambientGlowTop;
  final Color ambientGlowBottom;
  final Color cardBackground;
  final Color cardBorder;
  final Color cardShadow;
  final Color mascotGlowPrimary;
  final Color mascotGlowSecondary;
  final Color mascotBaseShadow;
  final Color titleColor;
  final Color bodyColor;
  final Color secondaryActionColor;
  final Color primaryButtonColor;
  final Color primaryButtonTextColor;
  final Color stepTileBackground;
  final Color stepTileBorder;
  final Color badgeBackground;
  final Color badgeBorder;
  final Color badgeTextColor;
  final Color activeIndicatorColor;
  final Color inactiveIndicatorColor;

  /// Resolves the [OnboardingPalette] for the current [BuildContext].
  factory OnboardingPalette.of(BuildContext context) {
    final CustomAppColors colors = context.customAppColors;
    final bool isDark = context.isDarkMode;

    return OnboardingPalette._(
      scaffoldBackground: isDark ? colors.primary900 : colors.background,
      ambientGlowTop: isDark
          ? colors.info900.withValues(alpha: 0.14)
          : colors.info300.withValues(alpha: 0.08),
      ambientGlowBottom: isDark
          ? colors.info300.withValues(alpha: 0.08)
          : colors.primary100.withValues(alpha: 0.22),
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
      mascotGlowPrimary: isDark
          ? colors.info700.withValues(alpha: 0.30)
          : colors.info300.withValues(alpha: 0.16),
      mascotGlowSecondary: isDark
          ? colors.info300.withValues(alpha: 0.16)
          : colors.info700.withValues(alpha: 0.08),
      mascotBaseShadow: isDark
          ? colors.primary900.withValues(alpha: 0.65)
          : colors.primary200.withValues(alpha: 0.40),
      titleColor: isDark ? colors.grey0 : colors.primary900,
      bodyColor: isDark
          ? colors.primary100.withValues(alpha: 0.86)
          : colors.neutral600,
      secondaryActionColor: isDark
          ? colors.primary100.withValues(alpha: 0.72)
          : colors.primary400,
      primaryButtonColor: Color.lerp(colors.info300, colors.info900, 0.35)!,
      primaryButtonTextColor: colors.grey0,
      stepTileBackground: isDark
          ? Color.lerp(colors.primary800, colors.info900, 0.35)!
          : Color.lerp(colors.grey50, colors.primary100, 0.20)!,
      stepTileBorder: isDark
          ? colors.primary600.withValues(alpha: 0.28)
          : colors.grey100,
      badgeBackground: isDark
          ? colors.info300.withValues(alpha: 0.14)
          : colors.info300.withValues(alpha: 0.10),
      badgeBorder: colors.info300.withValues(alpha: 0.65),
      badgeTextColor: isDark ? colors.primary100 : colors.info500,
      activeIndicatorColor: isDark
          ? Color.lerp(colors.info300, colors.grey0, 0.28)!
          : Color.lerp(colors.info300, colors.info900, 0.28)!,
      inactiveIndicatorColor: isDark
          ? colors.primary300.withValues(alpha: 0.35)
          : colors.primary100,
    );
  }
}
