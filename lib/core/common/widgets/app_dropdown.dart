import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:nivo/core/helpers/extensions.dart';
import 'package:nivo/core/theme/app_texts/app_text_styles.dart';
import 'package:nivo/core/theme/theme_manager/theme_extensions.dart';
import 'package:nivo/core/utils/common_imports.dart';

class AppDropdown<T> extends StatefulWidget {
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
  State<AppDropdown<T>> createState() => _AppDropdownState<T>();
}

class _AppDropdownState<T> extends State<AppDropdown<T>> {
  late final ValueNotifier<T?> _valueNotifier;

  T? _resolveSafeValue() {
    return (widget.value != null && widget.items.contains(widget.value))
        ? widget.value
        : null;
  }

  @override
  void initState() {
    super.initState();
    _valueNotifier = ValueNotifier<T?>(_resolveSafeValue());
  }

  @override
  void didUpdateWidget(covariant AppDropdown<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    final safeValue = _resolveSafeValue();
    if (_valueNotifier.value != safeValue) {
      _valueNotifier.value = safeValue;
    }
  }

  @override
  void dispose() {
    _valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.items.isEmpty) {
      return _disabledView(context);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonHideUnderline(
          child: DropdownButton2<T>(
            isExpanded: true,
            valueListenable: _valueNotifier,
            hint: Align(
              alignment: Alignment.centerRight,
              child: Text(
                widget.hint,
                style: AppTextStyles.font14Regular.copyWith(
                  color: context.customAppColors.neutral600,
                ),
              ),
            ),
            items: widget.items.map((item) {
              return DropdownItem<T>(
                value: item,
                height: 45.h,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    widget.labelBuilder(item),
                    style: AppTextStyles.font14Regular.copyWith(
                      color: context.customAppColors.neutral600,
                    ),
                  ),
                ),
              );
            }).toList(),
            onChanged: (selected) {
              _valueNotifier.value = selected;
              widget.onChanged(selected);
            },
            buttonStyleData: ButtonStyleData(
              height: 55.h,
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              decoration: BoxDecoration(
                color: context.customAppColors.neutral100,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: widget.errorText != null
                      ? context.customAppColors.error500
                      : Colors.transparent,
                ),
              ),
            ),
            iconStyleData: IconStyleData(
              icon: const Icon(Icons.expand_more_rounded),
              iconSize: 26.sp,
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 250.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: context.customAppColors.neutral100,
                boxShadow: const [
                  BoxShadow(blurRadius: 12, color: Colors.black12),
                ],
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(),
          ),
        ),
        if (widget.errorText != null) ...[
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
                  widget.errorText!,
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
        widget.hint,
        style: AppTextStyles.font14Regular.copyWith(
          color: context.customAppColors.neutral600,
        ),
      ),
    );
  }
}
