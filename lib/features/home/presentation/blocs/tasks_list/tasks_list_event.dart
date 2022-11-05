import '../../../../../definitions/enum/filter.dart';

class TasksListEvent {
  const TasksListEvent();
}

class TasksListLoadEvent extends TasksListEvent {
  const TasksListLoadEvent({
    this.searchStr = '',
    this.filterBy = FilterBy.all,
  });

  final String? searchStr;
  final FilterBy? filterBy;
}
