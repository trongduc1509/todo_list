import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/definitions/colors.dart';
import 'package:todo_list/definitions/default.dart';
import 'package:todo_list/definitions/dimesions.dart';
import 'package:todo_list/definitions/util/notifier.dart';
import 'package:todo_list/definitions/widgets/common_txt.dart';
import 'package:todo_list/definitions/widgets/date_picker.dart';
import 'package:todo_list/features/add_task/presentation/blocs/task_info/task_info_event.dart';

import '../../../../definitions/widgets/time_picker.dart';
import '../../../../models/task_model.dart';
import '../blocs/task_info/task_info_bloc.dart';
import '../blocs/task_info/task_info_state.dart';

class AddTaskContent extends StatefulWidget {
  const AddTaskContent({
    Key? key,
  }) : super(key: key);

  @override
  State<AddTaskContent> createState() => _AddTaskContentState();
}

class _AddTaskContentState extends State<AddTaskContent> {
  final _titleController = TextEditingController();
  final _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColor().onPrimary,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColor().onPrimary,
          leading: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            ),
          ),
        ),
        body: BlocListener<TaskInfoBloc, TaskInfoState>(
          listener: (context, state) {
            _titleController.text =
                state.tempTitle ?? state.detail?.title ?? '';
            _noteController.text = state.tempNote ?? state.detail?.note ?? '';
          },
          listenWhen: (p, c) => p.dataFilled != c.dataFilled,
          child: BlocBuilder<TaskInfoBloc, TaskInfoState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.detail?.id != null || state.inititalId != null
                            ? 'Task Detail'
                            : 'Add Task',
                        style: DefaultStyle().t20Bold,
                      ),
                      const SizedBox(
                        height: spaceBetweenLine20,
                      ),
                      Text(
                        'Title',
                        style: DefaultStyle().t16Bold,
                      ),
                      const SizedBox(
                        height: smallSpacing10,
                      ),
                      CommonTextField(
                        placeHolder: 'Enter title here.',
                        controller: _titleController,
                        txtSelected:
                            state.detail?.isCompleted == true ? () {} : null,
                        onChanged: (txt) {
                          context
                              .read<TaskInfoBloc>()
                              .add(TaskInfoUpdateFieldEvent(
                                tempTitle: _titleController.text.trim(),
                                tempNote: _noteController.text.trim(),
                                newTime:
                                    state.selectedDueTime ?? DateTime.now(),
                              ));
                          _titleController.text = txt;
                          _titleController.selection =
                              TextSelection.fromPosition(TextPosition(
                                  offset: _titleController.text.length));
                        },
                      ),
                      const SizedBox(
                        height: spaceBetweenLine15,
                      ),
                      Text(
                        'Note',
                        style: DefaultStyle().t16Bold,
                      ),
                      const SizedBox(
                        height: smallSpacing10,
                      ),
                      CommonTextField(
                        placeHolder: 'Enter note here.',
                        controller: _noteController,
                        maxLines: 5,
                        txtSelected:
                            state.detail?.isCompleted == true ? () {} : null,
                        onChanged: (txt) {
                          context
                              .read<TaskInfoBloc>()
                              .add(TaskInfoUpdateFieldEvent(
                                tempTitle: _titleController.text.trim(),
                                tempNote: _noteController.text.trim(),
                                newTime:
                                    state.selectedDueTime ?? DateTime.now(),
                              ));
                          _noteController.text = txt;
                          _noteController.selection =
                              TextSelection.fromPosition(TextPosition(
                                  offset: _noteController.text.length));
                        },
                      ),
                      const SizedBox(
                        height: spaceBetweenLine15,
                      ),
                      Text(
                        'Due Date',
                        style: DefaultStyle().t16Bold,
                      ),
                      const SizedBox(
                        height: smallSpacing10,
                      ),
                      DatePickerView(
                        active: state.detail?.isCompleted != true,
                        date: state.selectedDueTime,
                        title: 'Choose due date',
                        onDateChosen: (selectedDate) {
                          context
                              .read<TaskInfoBloc>()
                              .add(TaskInfoUpdateFieldEvent(
                                tempTitle: _titleController.text.trim(),
                                tempNote: _noteController.text.trim(),
                                newTime: selectedDate,
                              ));
                        },
                      ),
                      const SizedBox(
                        height: spaceBetweenLine15,
                      ),
                      Text(
                        'Due time',
                        style: DefaultStyle().t16Bold,
                      ),
                      const SizedBox(
                        height: smallSpacing10,
                      ),
                      TimePickerView(
                        active: state.detail?.isCompleted != true,
                        time: state.selectedDueTime,
                        title: 'Choose due time',
                        onTimeChosen: (selectedTime) {
                          context
                              .read<TaskInfoBloc>()
                              .add(TaskInfoUpdateFieldEvent(
                                tempTitle: _titleController.text.trim(),
                                tempNote: _noteController.text.trim(),
                                newTime: selectedTime,
                              ));
                        },
                      ),
                      const SizedBox(
                        height: spaceBetweenLine15,
                      ),
                      Text(
                        'Remind',
                        style: DefaultStyle().t16Bold,
                      ),
                      const SizedBox(
                        height: smallSpacing6,
                      ),
                      Text(
                        '*10 minutes early',
                        style: DefaultStyle().t16Bold.copyWith(
                              color: AppColor().onError,
                            ),
                      ),
                      const SizedBox(
                        height: spaceBetweenLine15,
                      ),
                      if (state.detail?.isCompleted != true)
                        if (state.isCreating)
                          Align(
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                              width: 120.0,
                              child: ElevatedButton(
                                child: const Text('Create task'),
                                style: DefaultStyle().progressButton,
                                onPressed: () {
                                  if (state.selectedDueTime == null) {
                                    return Notifier.showToast(context,
                                        isError: true,
                                        title: 'Warning',
                                        desctipion:
                                            'Please do not leave the due date section empty!');
                                  }
                                  if (state.selectedDueTime!
                                          .compareTo(DateTime.now()) <
                                      0) {
                                    return Notifier.showToast(context,
                                        isError: true,
                                        title: 'Error',
                                        desctipion:
                                            'Please select the due date after current date&time!');
                                  }
                                  if (state.selectedDueTime!
                                          .difference(DateTime.now())
                                          .inMinutes <=
                                      10) {
                                    return Notifier.showToast(context,
                                        isError: true,
                                        title: 'Error',
                                        desctipion:
                                            'Please select the due date after current date&time at lease 10 minutes!');
                                  }
                                  context
                                      .read<TaskInfoBloc>()
                                      .add(TaskInfoCreateEvent(
                                          newTask: Task(
                                        title: _titleController.text.trim(),
                                        note: _noteController.text.trim(),
                                        dueTime: state.selectedDueTime,
                                      )));
                                },
                              ),
                            ),
                          )
                        else if (state.tempTitle != state.detail?.title ||
                            state.tempNote != state.detail?.note ||
                            state.selectedDueTime != state.detail?.dueTime)
                          Align(
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                              width: 120.0,
                              child: ElevatedButton(
                                child: const Text('Save'),
                                style: DefaultStyle().progressButton,
                                onPressed: () {
                                  if (state.selectedDueTime == null) {
                                    return Notifier.showToast(context,
                                        isError: true,
                                        title: 'Warning',
                                        desctipion:
                                            'Please do not leave the due date section empty!');
                                  }
                                  if (state.selectedDueTime!
                                          .compareTo(DateTime.now()) <=
                                      0) {
                                    return Notifier.showToast(context,
                                        isError: true,
                                        title: 'Error',
                                        desctipion:
                                            'Please select the due date after current date&time!');
                                  }
                                  if (state.selectedDueTime!
                                          .difference(DateTime.now())
                                          .inMinutes <=
                                      10) {
                                    return Notifier.showToast(context,
                                        isError: true,
                                        title: 'Error',
                                        desctipion:
                                            'Please select the due date after current date&time at lease 10 minutes!');
                                  }
                                  context
                                      .read<TaskInfoBloc>()
                                      .add(TaskInfoUpdateEvent(
                                          updateTask: Task(
                                        id: state.detail?.id,
                                        title: _titleController.text.trim(),
                                        note: _noteController.text.trim(),
                                        dueTime: state.selectedDueTime,
                                      )));
                                },
                              ),
                            ),
                          )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      );
}
