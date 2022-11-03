import 'package:flutter/material.dart';
import 'package:todo_list/definitions/colors.dart';
import 'package:todo_list/definitions/default.dart';
import 'package:todo_list/definitions/dimesions.dart';

class AddTaskContent extends StatelessWidget {
  const AddTaskContent({Key? key}) : super(key: key);

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
              ],
            ),
          ),
        ),
      );
}
