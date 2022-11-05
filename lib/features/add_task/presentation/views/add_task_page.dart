import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/features/add_task/presentation/blocs/task_info/task_info_state.dart';

import '../blocs/task_info/task_info_bloc.dart';
import 'add_task_content.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({
    Key? key,
    this.id,
  }) : super(key: key);

  final int? id;

  @override
  Widget build(BuildContext context) => BlocProvider<TaskInfoBloc>(
        create: (context) => TaskInfoBloc(TaskInfoState(
          inititalId: id,
          isCreating: id == null,
        )),
        child: const AddTaskContent(),
      );
}
