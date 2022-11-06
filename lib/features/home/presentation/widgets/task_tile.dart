import 'package:flutter/material.dart';
import 'package:todo_list/definitions/dimesions.dart';
import 'package:todo_list/services/local_noti_service.dart';

import '../../../../models/task_model.dart';
import '../../../../definitions/helper/time.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task? task;

  @override
  Widget build(BuildContext context) {
    if (task?.isCompleted != true) {
      LocalNotiService.showScheduledNotification(
          id: task!.id!, title: task?.title, scheduledTime: task!.dueTime!);
    }
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 12.0,
      ),
      decoration: BoxDecoration(
        color: task?.isCompleted ?? false ? Colors.green : Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(task?.title ?? '',
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              const SizedBox(
                height: spaceBetweenLine12,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.access_time_rounded,
                    color: Colors.grey[200],
                    size: 18,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    task?.dueTime?.convertDate('dd/MM/yyyy HH:mm') ?? '',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: spaceBetweenLine12,
              ),
              Text(
                task?.note ?? '',
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          height: 60,
          width: 1.0,
          color: Colors.grey[200]!.withOpacity(0.7),
        ),
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            task?.isCompleted == true ? 'COMPLETED' : 'TODO',
            style: const TextStyle(
                fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ]),
    );
  }
}
