import 'package:flutter/cupertino.dart';
import 'package:sanad_app/core/utils/common_imports.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.customAppColors.grey0,
      title: Text(
        text,
        style: AppTextStyles.font20SemiBold.copyWith(
          color: context.customAppColors.grey900,
        ),
      ),
      centerTitle: true,
      leading: Center(
        child: Container(
          height: 24.h,
          width: 24.w,
          decoration: BoxDecoration(
            color: context.customAppColors.primary500,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () => GoRouter.of(context).pop(),
            child: Icon(
              Icons.arrow_back_ios_new,
              color: context.customAppColors.white,
              size: 16.sp,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
