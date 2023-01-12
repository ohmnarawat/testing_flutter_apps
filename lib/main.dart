import 'package:flutter/material.dart';
import 'package:testing_flutter_apps/pages/counter_page.dart';
import 'package:testing_flutter_apps/pages/widget_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const CounterPage(title: 'Flutter Demo Home Page'),
      home: const WidgetListPage(),
    );
  }
}
