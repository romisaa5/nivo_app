import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nivo/core/common/widgets/custom_text_form_field.dart';
import 'package:nivo/core/helpers/extensions.dart';
import 'package:nivo/core/theme/app_texts/app_text_styles.dart';
import 'package:nivo/features/authentication/presentation/animations/auth_motion_config.dart';
import 'package:nivo/features/authentication/presentation/theme/auth_palette.dart';

/// Labeled, animated text field wrapping Core [AppTextFormField].
class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    required this.animationIndex,
    this.validator,
    this.keyboardType,
    this.isObscured = false,
    this.suffixIcon,
    this.focusNode,
    this.onChanged,
  });

  final String label;
  final String hintText;
  final TextEditingController controller;
  final int animationIndex;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool isObscured;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    final palette = AuthPalette.of(context);
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    OutlineInputBorder buildBorder(Color color, {double width = 1.0}) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(14.r),
        borderSide: BorderSide(color: color, width: width.w),
      );
    }

    return FadeInUp(
      from: 14,
      duration: AuthMotionConfig.fieldDuration,
      delay: AuthMotionConfig.fieldDelay(animationIndex),
      curve: AuthMotionConfig.entranceCurve,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            label,
            textAlign: TextAlign.start,
            style: AppTextStyles.font14Medium.copyWith(
              color: palette.fieldLabelColor,
              letterSpacing: isRtl ? 0 : null,
            ),
          ),
          8.h.ph,
          AppTextFormField(
            controller: controller,
            focusNode: focusNode,
            validator: validator,
            onChanged: onChanged,
            keyboardType: keyboardType,
            isObscureText: isObscured,
            hintText: hintText,
            suffixIcon: suffixIcon,
            backgroundColor: palette.fieldFillColor,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 15.h,
            ),
            enabledBorder: buildBorder(palette.fieldBorderColor),
            focusedBorder: buildBorder(
              palette.fieldFocusedBorderColor,
              width: 1.4,
            ),
            errorBorder: buildBorder(
              palette.fieldErrorBorderColor,
              width: 1.2,
            ),
            hintStyle: AppTextStyles.font14Regular.copyWith(
              color: palette.fieldHintColor,
              letterSpacing: isRtl ? 0 : null,
            ),
            inputTextStyle: AppTextStyles.font14Medium.copyWith(
              color: palette.fieldTextColor,
              letterSpacing: isRtl ? 0 : null,
            ),
          ),
        ],
      ),
    );
  }
}
