import 'package:flutter/material.dart';
import 'package:nivo/core/theme/app_texts/app_text_styles.dart';
import 'package:nivo/core/theme/theme_manager/theme_extensions.dart';

class AppSnackBar {
  /// ================== Error ==================
  static void showError(BuildContext context, String message) {
    _show(
      context,
      message: message,
      backgroundColor: context.customAppColors.error500,
      icon: Icons.error_outline,
    );
  }

  /// ================== Success ==================
  static void showSuccess(BuildContext context, String message) {
    _show(
      context,
      message: message,
      backgroundColor: context.customAppColors.greenGradient.first,
      icon: Icons.check_circle_outline,
    );
  }

  /// ================== Info ==================
  static void showInfo(BuildContext context, String message) {
    _show(
      context,
      message: message,
      backgroundColor: context.customAppColors.info700,
      icon: Icons.info_outline,
    );
  }

  /// ================== Core Method ==================
  static void _show(
    BuildContext context, {
    required String message,
    required Color backgroundColor,
    required IconData icon,
  }) {
    final colors = context.customAppColors;
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: colors.grey0.withValues(alpha: 0),
        elevation: 0,
        duration: const Duration(seconds: 3),
        content: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(icon, color: colors.grey0),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  message,
                  style: AppTextStyles.font14Medium.copyWith(
                    color: colors.grey0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
