import 'package:todo_list/models/task_model.dart';

class TaskInfoEvent {
  const TaskInfoEvent();
}

class TaskInfoCreateEvent extends TaskInfoEvent {
  const TaskInfoCreateEvent({
    required this.newTask,
  });

  final Task newTask;
}

class TaskInfoLoadEvent extends TaskInfoEvent {
  const TaskInfoLoadEvent({
    required this.taskId,
  });

  final int taskId;
}

// class TaskInfoLoadListEvent {
//   const TaskInfoLoadListEvent({
//     this.searchStr = '',
//     this.filterBy = FilterBy.all,
//   });

//   final String? searchStr;
//   final FilterBy? filterBy;
// }

class TaskInfoUpdateEvent extends TaskInfoEvent {
  const TaskInfoUpdateEvent({
    required this.updateTask,
  });

  final Task updateTask;
}

class TaskInfoDeleteEvent extends TaskInfoEvent {
  const TaskInfoDeleteEvent({
    required this.deleteTask,
  });

  final Task deleteTask;
}

class TaskInfoUpdateFieldEvent extends TaskInfoEvent {
  const TaskInfoUpdateFieldEvent({
    required this.tempTitle,
    required this.tempNote,
    required this.newTime,
  });

  final String tempTitle;
  final String tempNote;
  final DateTime newTime;
}

class TaskInfoDataFilledEvent extends TaskInfoEvent {}
