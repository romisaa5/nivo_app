import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nivo/core/helpers/extensions.dart';

/// Vertical spacer separating primary and social authentication actions.
class AuthDivider extends StatelessWidget {
  const AuthDivider({super.key, this.height});

  final double? height;

  @override
  Widget build(BuildContext context) {
    return (height ?? 12.h).ph;
  }
}
