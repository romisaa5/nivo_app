import 'package:nivo/core/utils/common_imports.dart';

TimeOfDay? parseTime(String time) {
  if (time == "00:00:00") return null;

  final parts = time.split(":");
  return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
}

String formatTime(TimeOfDay? time) {
  if (time == null) return "00:00";

  final hour = time.hour.toString().padLeft(2, '0');
  final minute = time.minute.toString().padLeft(2, '0');

  return "$hour:$minute";
}
