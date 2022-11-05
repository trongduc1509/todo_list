import '../definitions/helper/time.dart';

const String tableTask = 'tasks';

class TaskFields {
  static const List<String> values = [
    id,
    title,
    note,
    startTime,
    isCompleted,
  ];

  static const String id = '_id';
  static const String title = 'title';
  static const String note = 'note';
  static const String startTime = 'start_time';
  static const String isCompleted = 'is_completed';
}

class Task {
  final int? id;
  final String title;
  final String note;
  final DateTime? startTime;
  final bool isCompleted;

  Task({
    this.id,
    required this.title,
    required this.note,
    required this.startTime,
    this.isCompleted = false,
  });

  static Task fromJSON(Map<String, Object?> map) => Task(
        id: map[TaskFields.id] as int?,
        title: map[TaskFields.title] as String,
        note: map[TaskFields.note] as String,
        startTime: jsonToTime(map[TaskFields.startTime] as String),
        isCompleted: (map[TaskFields.isCompleted] as int) == 1,
      );

  Task copy(
          {int? id,
          String? title,
          String? note,
          DateTime? startTime,
          bool? isCompleted}) =>
      Task(
        id: id ?? this.id,
        title: title ?? this.title,
        note: note ?? this.note,
        startTime: startTime ?? this.startTime,
        isCompleted: isCompleted ?? this.isCompleted,
      );

  Map<String, Object?> toJSON() => {
        TaskFields.id: id,
        TaskFields.title: title,
        TaskFields.note: note,
        TaskFields.startTime: timeToJson(startTime),
        TaskFields.isCompleted: isCompleted ? 1 : 0,
      };
}
