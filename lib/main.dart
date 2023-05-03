import 'package:flutter/material.dart';
import 'package:todoapp/screens/entry.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/models/task_data.dart';
import 'constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kBackgroundColor,
            appBarTheme: const AppBarTheme(backgroundColor: kBackgroundColor)),
        debugShowCheckedModeBanner: false,
        home: Entry(),
      ),
    );
  }
}
