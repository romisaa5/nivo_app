import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nivo/features/authentication/presentation/theme/auth_palette.dart';

/// Animated eye toggle button for showing or hiding password input.
class PasswordVisibilityButton extends StatelessWidget {
  const PasswordVisibilityButton({
    super.key,
    required this.isObscured,
    required this.onToggle,
  });

  final bool isObscured;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    final palette = AuthPalette.of(context);

    return IconButton(
      onPressed: onToggle,
      splashRadius: 20.r,
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        transitionBuilder: (child, animation) =>
            ScaleTransition(scale: animation, child: child),
        child: Icon(
          isObscured
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
          key: ValueKey<bool>(isObscured),
          color: palette.fieldIconColor,
          size: 20.sp,
        ),
      ),
    );
  }
}
