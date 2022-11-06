import 'package:flutter/material.dart';
import 'package:todo_list/services/local_noti_service.dart';

import 'features/home/presentation/views/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotiService.initialize(isScheduled: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
