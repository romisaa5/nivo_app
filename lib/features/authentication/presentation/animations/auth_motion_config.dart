import 'package:flutter/animation.dart';

/// Shared timing, stagger, and curve configuration for authentication screens.
class AuthMotionConfig {
  const AuthMotionConfig._();

  static const Duration brandDuration = Duration(milliseconds: 420);
  static const Duration mascotDuration = Duration(milliseconds: 500);
  static const Duration bubbleDuration = Duration(milliseconds: 460);
  static const Duration cardDuration = Duration(milliseconds: 450);
  static const Duration fieldDuration = Duration(milliseconds: 420);
  static const Duration buttonDuration = Duration(milliseconds: 460);
  static const Duration footerDuration = Duration(milliseconds: 420);

  static const Duration brandDelay = Duration(milliseconds: 30);
  static const Duration mascotDelay = Duration(milliseconds: 80);
  static const Duration bubbleDelay = Duration(milliseconds: 180);
  static const Duration sectionHeaderDelay = Duration(milliseconds: 140);
  static const Duration footerDelay = Duration(milliseconds: 480);

  static Duration fieldDelay(int index) =>
      Duration(milliseconds: 200 + (index * 75));

  static Duration actionDelay(int index) =>
      Duration(milliseconds: 360 + (index * 75));

  static const Curve entranceCurve = Curves.easeOutCubic;
  static const Curve zoomCurve = Curves.easeOutBack;
}
