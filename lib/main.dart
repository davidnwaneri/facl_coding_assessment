import 'package:facl_locker_room/theme/app_colours.dart';
import 'package:flutter/material.dart';

import 'view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FACL Locker Room',
      theme: ThemeData(
        fontFamily: 'Satoshi',
        primarySwatch: Colors.blue,
        elevatedButtonTheme: _elevatedButtonTheme,
        textTheme: _textTheme,
      ),
      home: const MyHomePage(),
    );
  }

  /// A `ThemeData` object that contains the `ElevatedButtonThemeData` for the app.
  ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0.2,
        backgroundColor: Colors.white,
        textStyle: const TextStyle(
          color: AppColours.greyish,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  /// A `ThemeData` object that contains the `TextTheme` for the app.
  TextTheme get _textTheme {
    return const TextTheme(
      bodyText1: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        // align text to the center
      ),
      bodyText2: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
