import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/db/tasks_database.dart';
import 'package:todo_list/definitions/enum/filter.dart';

import 'tasks_list_event.dart';
import 'tasks_list_state.dart';

class TasksListBloc extends Bloc<TasksListEvent, TasksListState> {
  TasksListBloc(TasksListState initialState) : super(initialState) {
    on<TasksListLoadEvent>(_onLoad);
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
    emit(state.copyWith(
      tasksList: result,
      isLoading: false,
    ));
  }
}
