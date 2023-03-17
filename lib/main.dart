import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testing/src/feature/first_feature/presentation/home/home.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
            displayMedium: TextStyle(fontSize: 14, color: Color(0xffEEE9DA))),
        useMaterial3: true,
        primaryColor: const Color(0xffBDCDD6),
      ),
      home: const Home(),
    );
  }
}
