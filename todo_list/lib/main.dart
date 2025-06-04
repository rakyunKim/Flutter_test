import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_hive_db/datapage.dart';

Future<void> main(List<String> args) async {
  await Hive.initFlutter();
  await Hive.openBox("hivebox");
  runApp(const MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green)
      ),
      home: const Datapage(),
    );
  }
}