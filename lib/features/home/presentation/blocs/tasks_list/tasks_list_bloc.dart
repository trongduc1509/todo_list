import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/db/tasks_database.dart';
import 'package:todo_list/definitions/enum/filter.dart';
import 'package:todo_list/services/local_noti_service.dart';

import '../../../../../models/task_model.dart';
import 'tasks_list_event.dart';
import 'tasks_list_state.dart';

class TasksListBloc extends Bloc<TasksListEvent, TasksListState> {
  TasksListBloc(TasksListState initialState) : super(initialState) {
    on<TasksListLoadEvent>(_onLoad);
    on<TasksListUpdateCompletedSingleEvent>(_onUpdateSingle);
    on<TasksListRemoveTaskEvent>(_onDelete);
    add(const TasksListLoadEvent());
  }

  void _onLoad(TasksListLoadEvent event, emit) async {
    emit(state.copyWith(
      isLoading: true,
    ));
    final taskdb = TaskDatabase();
    var result = await taskdb.searchTask(
        event.searchStr ?? state.searchStr ?? '',
        event.filterBy ?? state.filterBy ?? FilterBy.all);

    var checkedList = <Task>[];
    var compareDate = DateTime.now();
    if (event.filterBy == FilterBy.today) {
      for (Task e in result) {
        if (e.dueTime!.compareTo(DateTime(
                    compareDate.year, compareDate.month, compareDate.day)) >=
                0 &&
            e.dueTime!.compareTo(DateTime(compareDate.year, compareDate.month,
                    compareDate.day, 23, 59, 59)) <=
                0) {
          checkedList.add(e);
        }
      }
    } else if (event.filterBy == FilterBy.upcoming) {
      for (Task e in result) {
        if (e.dueTime!.compareTo(compareDate) > 0) {
          checkedList.add(e);
        }
      }
    }

    emit(state.copyWith(
      tasksList: (event.filterBy != null && event.filterBy! != FilterBy.all)
          ? checkedList
          : result,
      searchStr: event.searchStr ?? state.searchStr ?? '',
      filterBy: event.filterBy ?? state.filterBy ?? FilterBy.all,
      isLoading: false,
    ));
  }

  void _onUpdateSingle(TasksListUpdateCompletedSingleEvent event, emit) async {
    final taskdb = TaskDatabase();
    var update = await taskdb.updateTask(event.updateTask);
    add(const TasksListLoadEvent());
  }

  void _onDelete(TasksListRemoveTaskEvent event, emit) async {
    final taskdb = TaskDatabase();
    if (event.delTask != null && event.delTask!.id != null) {
      await taskdb.deleteTask(event.delTask!.id!);
      LocalNotiService.cancelIdentifiedNoti(event.delTask!.id!);
    }
    add(const TasksListLoadEvent());
  }
}
