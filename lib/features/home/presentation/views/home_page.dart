import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/features/home/presentation/blocs/tasks_list/tasks_list_bloc.dart';
import 'package:todo_list/features/home/presentation/blocs/tasks_list/tasks_list_state.dart';

import 'home_content.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider<TasksListBloc>(
        create: (context) => TasksListBloc(const TasksListState()),
        child: const HomeContent(),
      );
}
