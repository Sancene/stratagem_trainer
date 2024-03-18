import 'package:flutter/material.dart';

final _base = ThemeData(colorSchemeSeed: const Color(0xffffff00));

final appTheme = ThemeData(
  scaffoldBackgroundColor: Colors.black87,
  brightness: Brightness.dark,
  textTheme: _base.textTheme.copyWith(
    displayLarge: const TextStyle(
      fontSize: 72,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: const TextStyle(
      fontFamily: 'Sinclair',
      fontSize: 36,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    titleMedium: const TextStyle(
      fontFamily: 'Sinclair',
      fontSize: 20,
      color: Colors.white70,
    ),
    bodyMedium: const TextStyle(
      fontFamily: 'Sinclair',
      fontSize: 16,
      color: Colors.white70,
    ),
  ),
);
