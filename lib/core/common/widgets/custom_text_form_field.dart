import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nivo/core/theme/app_texts/app_text_styles.dart';
import 'package:nivo/core/theme/theme_manager/theme_extensions.dart';

class AppTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String? hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final InputBorder? errorBorder;
  final int? maxLines;
  final bool isUnderline;
  final TextInputType? keyboardType;
  final TextAlign? textAlign;
  final bool isBorder;

  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    this.validator,
    this.prefixIcon,
    this.focusNode,
    this.onChanged,
    this.errorBorder,
    this.maxLines,
    this.isUnderline = false,
    this.keyboardType,
    this.textAlign,
    this.isBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.customAppColors;
    final isDark = context.isDarkMode;

    InputBorder border = isUnderline
        ? UnderlineInputBorder(
            borderSide: BorderSide(
              color: isBorder
                  ? colors.grey400
                  : colors.grey0.withValues(alpha: 0),
              width: 1.w,
            ),
          )
        : OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(
              color: isBorder
                  ? colors.grey400
                  : colors.grey0.withValues(alpha: 0),
              width: 1.w,
            ),
          );

    return FormField<String>(
      validator: validator,
      builder: (FormFieldState<String> state) {
        final effectiveEnabledBorder = state.hasError
            ? (errorBorder ??
                  border.copyWith(
                    borderSide: BorderSide(
                      color: colors.error500,
                      width: 1.2.w,
                    ),
                  ))
            : (enabledBorder ?? border);
        final effectiveFocusedBorder = state.hasError
            ? (errorBorder ??
                  border.copyWith(
                    borderSide: BorderSide(
                      color: colors.error500,
                      width: 1.5.w,
                    ),
                  ))
            : (focusedBorder ??
                  border.copyWith(
                    borderSide: BorderSide(
                      color: isBorder
                          ? colors.primary600
                          : colors.grey0.withValues(alpha: 0),
                      width: 1.5.w,
                    ),
                  ));

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              onFieldSubmitted: (_) {
                FocusScope.of(context).unfocus();
              },
              onTapOutside: (_) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
              keyboardType: keyboardType,
              textAlign: textAlign ?? TextAlign.start,
              maxLines: maxLines ?? 1,
              controller: controller,
              onChanged: (value) {
                state.didChange(value);
                onChanged?.call(value);
              },
              focusNode: focusNode,
              obscureText: isObscureText ?? false,
              cursorColor: isDark ? colors.primary300 : colors.primary800,
              decoration: InputDecoration(
                isDense: true,
                contentPadding:
                    contentPadding ??
                    EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
                focusedBorder: effectiveFocusedBorder,
                enabledBorder: effectiveEnabledBorder,
                errorBorder:
                    errorBorder ??
                    border.copyWith(
                      borderSide: BorderSide(
                        color: colors.error500,
                        width: 1.2.w,
                      ),
                    ),
                focusedErrorBorder:
                    errorBorder ??
                    border.copyWith(
                      borderSide: BorderSide(
                        color: colors.error500,
                        width: 1.2.w,
                      ),
                    ),

                hintText: hintText,
                hintStyle:
                    hintStyle ??
                    AppTextStyles.font14Regular.copyWith(
                      color: isDark ? colors.neutral400 : colors.neutral500,
                    ),
                suffixIcon: suffixIcon,
                prefixIcon: prefixIcon,
                fillColor:
                    backgroundColor ??
                    (isDark ? colors.neutral900 : colors.grey0),
                filled: true,
              ),
              style:
                  inputTextStyle ??
                  AppTextStyles.font16Regular.copyWith(
                    color: isDark ? colors.grey0 : colors.neutral900,
                  ),
            ),
            if (state.hasError)
              Padding(
                padding: EdgeInsetsDirectional.only(top: 6.h, start: 4.w),
                child: Row(
                  children: [
                    Icon(
                      Icons.error_outline,
                      color: colors.error500,
                      size: 16.sp,
                    ),
                    5.w.horizontalSpace,
                    Flexible(
                      child: Text(
                        state.errorText ?? '',
                        style: AppTextStyles.font12Regular.copyWith(
                          color: colors.error500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }
}
