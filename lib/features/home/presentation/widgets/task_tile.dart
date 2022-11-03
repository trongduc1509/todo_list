import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 12.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Task title",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              const SizedBox(
                height: 12,
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
                  const Text(
                    "startime - endtime",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Text(
                "task note",
                style: TextStyle(
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
        const RotatedBox(
          quarterTurns: 3,
          child: Text(
            "TODO",
            style: TextStyle(
                fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ]),
    );
  }
}
