import 'package:equatable/equatable.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:todo_list/definitions/enum/filter.dart';

import '../../../../../models/task_model.dart';

part 'tasks_list_state.g.dart';

@CopyWith()
class TasksListState extends Equatable {
  const TasksListState({
    this.tasksList = const [],
    this.searchStr = '',
    this.filterBy = FilterBy.all,
    this.isLoading = true,
  });

  final List<Task>? tasksList;
  final String? searchStr;
  final FilterBy? filterBy;
  final bool isLoading;

  @override
  List<Object?> get props => [
        tasksList,
        searchStr,
        filterBy,
        isLoading,
      ];
}
