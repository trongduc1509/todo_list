import 'package:equatable/equatable.dart';

import '../../../../../models/task_model.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'task_info_state.g.dart';

@CopyWith()
class TaskInfoState extends Equatable {
  const TaskInfoState({
    this.inititalId,
    this.detail,
    this.tempTitle,
    this.tempNote,
    this.selectedDueTime,
    this.isLoading = true,
    this.isCreating = true,
    this.dataFilled = false,
  });

  final int? inititalId;
  final Task? detail;
  final String? tempTitle;
  final String? tempNote;
  final DateTime? selectedDueTime;
  final bool isLoading;
  final bool isCreating;
  final bool dataFilled;

  @override
  List<Object?> get props => [
        inititalId,
        detail,
        tempTitle,
        tempNote,
        selectedDueTime,
        isLoading,
        isCreating,
        dataFilled,
      ];
}
