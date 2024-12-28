import 'package:calbirthdate/calLogic.dart';
import 'package:calbirthdate/classLogic.dart';
import 'package:calbirthdate/myapp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark, // Dark theme
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.lightBlue),
        ),
      ),
      themeMode: ThemeMode.dark,
      home: Scaffold(
        body: BlocProvider(
          create: (_) => BirthBloc(),
          child: MyApp(),
        ),
      ),
    );
  }
}
