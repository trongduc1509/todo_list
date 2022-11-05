import '../../../../../definitions/enum/filter.dart';
import '../../../../../models/task_model.dart';

class TasksListEvent {
  const TasksListEvent();
}

class TasksListLoadEvent extends TasksListEvent {
  const TasksListLoadEvent({
    this.searchStr,
    this.filterBy,
  });

  final String? searchStr;
  final FilterBy? filterBy;
}

class TasksListUpdateCompletedSingleEvent extends TasksListEvent {
  const TasksListUpdateCompletedSingleEvent({
    required this.updateTask,
  });

  final Task updateTask;
}

class TasksListRemoveTaskEvent extends TasksListEvent {
  const TasksListRemoveTaskEvent({
    this.delTask,
  });

  final Task? delTask;
}
