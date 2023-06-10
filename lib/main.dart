import 'package:flutter/material.dart';

import 'features/number_trivia/presentation/pages/number_trivia_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Number Trivia',
      theme: ThemeData(
        primaryColor: Colors.green[800],
        hintColor: Colors.green[600],
        appBarTheme: AppBarTheme(
          color: Colors.green[800],
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const NumberTriviaPage(),
    );
  }
}
