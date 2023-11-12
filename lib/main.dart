import 'package:flutter/material.dart';

import 'dio.dart';
import 'homeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

 await dioclass.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hotel',
      theme: ThemeData(

        primarySwatch: Colors.teal,
      ),
      home:  Home(),
    );
  }
}
