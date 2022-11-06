import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/db/tasks_database.dart';
import 'task_info_event.dart';
import 'task_info_state.dart';

class TaskInfoBloc extends Bloc<TaskInfoEvent, TaskInfoState> {
  TaskInfoBloc(TaskInfoState initialState) : super(initialState) {
    on<TaskInfoCreateEvent>(_taskInfoCreate);
    on<TaskInfoLoadEvent>(_taskInfoLoad);
    on<TaskInfoUpdateEvent>(_taskInfoUpdate);
    on<TaskInfoDeleteEvent>(_taskInfoDelete);
    on<TaskInfoDataFilledEvent>(_taskInfoDataFilled);
    on<TaskInfoUpdateFieldEvent>(_taskInfoUpdateField);
    if (initialState.inititalId != null) {
      add(TaskInfoLoadEvent(taskId: state.inititalId!));
    }
  }

  void _taskInfoCreate(TaskInfoCreateEvent event, emit) async {
    final taskdb = TaskDatabase();
    var newTask = await taskdb.createTask(event.newTask);
    emit(state.copyWith(
      detail: newTask,
      isCreating: false,
    ));
  }

  void _taskInfoLoad(TaskInfoLoadEvent event, emit) async {
    final taskdb = TaskDatabase();
    var detailTask = await taskdb.readTask(event.taskId);
    emit(state.copyWith(
      detail: detailTask,
      tempTitle: detailTask.title,
      tempNote: detailTask.note,
      selectedDueTime: detailTask.dueTime,
      isLoading: false,
    ));
    add(TaskInfoDataFilledEvent());
  }

  void _taskInfoUpdate(TaskInfoUpdateEvent event, emit) async {
    if (event.updateTask.id == null) return;
    final taskdb = TaskDatabase();
    var updatedTask = await taskdb.updateTask(event.updateTask);

    emit(state.copyWith(
      detail: event.updateTask,
      tempTitle: event.updateTask.title,
      tempNote: event.updateTask.note,
      selectedDueTime: event.updateTask.dueTime,
      isCreating: false,
    ));
  }

  void _taskInfoDelete(TaskInfoDeleteEvent event, emit) {}

  void _taskInfoUpdateField(TaskInfoUpdateFieldEvent event, emit) {
    emit(state.copyWith(
      tempTitle: event.tempTitle,
      tempNote: event.tempNote,
      selectedDueTime: event.newTime,
    ));
  }

  void _taskInfoDataFilled(TaskInfoDataFilledEvent event, emit) {
    emit(state.copyWith(
      dataFilled: !state.dataFilled,
    ));
  }
}
