import 'package:flutter/material.dart';
import 'package:todo_list/definitions/colors.dart';
import 'package:todo_list/definitions/default.dart';
import 'package:todo_list/definitions/dimesions.dart';
import 'package:todo_list/definitions/widgets/common_txt.dart';
import 'package:todo_list/definitions/widgets/date_picker.dart';

import '../../../../definitions/widgets/time_picker.dart';

enum TaskDetailPageType { add, read, update }

class AddTaskContent extends StatefulWidget {
  const AddTaskContent({
    Key? key,
    this.pageType = TaskDetailPageType.add,
  }) : super(key: key);

  final TaskDetailPageType pageType;

  @override
  State<AddTaskContent> createState() => _AddTaskContentState();
}

class _AddTaskContentState extends State<AddTaskContent> {
  final _titleController = TextEditingController();
  final _noteController = TextEditingController();
  DateTime? _startDate;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColor().onPrimary,
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
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
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 12.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add Task',
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
                ),
                const SizedBox(
                  height: spaceBetweenLine15,
                ),
                Text(
                  'Date',
                  style: DefaultStyle().t16Bold,
                ),
                const SizedBox(
                  height: smallSpacing10,
                ),
                DatePickerView(
                  active: true,
                  date: _startDate,
                  title: 'Choose start date',
                  onDateChosen: (selectedDate) {
                    setState(() {
                      _startDate = selectedDate;
                    });
                  },
                ),
                const SizedBox(
                  height: spaceBetweenLine15,
                ),
                Text(
                  'Start time',
                  style: DefaultStyle().t16Bold,
                ),
                const SizedBox(
                  height: smallSpacing10,
                ),
                TimePickerView(
                  active: true,
                  time: _startDate,
                  title: 'Choose start time',
                  onTimeChosen: (selectedTime) {
                    setState(() {
                      _startDate = selectedTime;
                    });
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
                  height: smallSpacing10,
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
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: 120.0,
                    child: ElevatedButton(
                      child: const Text('Create task'),
                      style: DefaultStyle().progressButton,
                      onPressed: () {},
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
