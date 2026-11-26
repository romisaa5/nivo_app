import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:nivo/core/helpers/extensions.dart';
import 'package:nivo/core/theme/app_texts/app_text_styles.dart';
import 'package:nivo/core/theme/theme_manager/theme_extensions.dart';
import 'package:nivo/core/utils/common_imports.dart';

class AppDropdown<T> extends StatelessWidget {
  final String hint;
  final T? value;
  final List<T> items;
  final String Function(T) labelBuilder;
  final void Function(T?) onChanged;
  final String? errorText;

  const AppDropdown({
    super.key,
    required this.hint,
    required this.value,
    required this.items,
    required this.labelBuilder,
    required this.onChanged,
    this.errorText,
  });
  @override
  Widget build(BuildContext context) {
    final safeValue = (value != null && items.contains(value)) ? value : null;
    if (items.isEmpty) {
      return _disabledView(context);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonHideUnderline(
          child: DropdownButton2<T>(
            isExpanded: true,
            value: safeValue,
            hint: Align(
              alignment: Alignment.centerRight,
              child: Text(
                hint,
                style: AppTextStyles.font14Regular.copyWith(
                  color: context.customAppColors.neutral600,
                ),
              ),
            ),
            items: items.map((item) {
              return DropdownMenuItem<T>(
                value: item,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    labelBuilder(item),
                    style: AppTextStyles.font14Regular.copyWith(
                      color: context.customAppColors.neutral600,
                    ),
                  ),
                ),
              );
            }).toList(),
            onChanged: onChanged,
            buttonStyleData: ButtonStyleData(
              height: 55.h,
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              decoration: BoxDecoration(
                color: context.customAppColors.neutral100,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: errorText != null
                      ? context.customAppColors.error500
                      : Colors.transparent,
                ),
              ),
            ),
            iconStyleData: IconStyleData(
              icon: Icon(Icons.expand_more_rounded),
              iconSize: 26.sp,
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 250.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: context.customAppColors.neutral100,
                boxShadow: [BoxShadow(blurRadius: 12, color: Colors.black12)],
              ),
            ),
            menuItemStyleData: MenuItemStyleData(height: 45.h),
          ),
        ),

        if (errorText != null) ...[
          6.h.ph,
          Row(
            children: [
              Icon(
                Icons.error,
                color: context.customAppColors.error500,
                size: 18.sp,
              ),
              5.w.pw,
              Expanded(
                child: Text(
                  errorText!,
                  style: AppTextStyles.font12Regular.copyWith(
                    color: context.customAppColors.error500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }

  Widget _disabledView(BuildContext context) {
    return Container(
      height: 55.h,
      width: double.infinity,
      alignment: Alignment.centerRight,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: context.customAppColors.neutral100,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(
        hint,
        style: AppTextStyles.font14Regular.copyWith(
          color: context.customAppColors.neutral600,
        ),
      ),
    );
  }
}
