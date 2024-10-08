import 'package:flutter/material.dart';

const List<Color> colorList = [
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.pink,
  Colors.pinkAccent,
  Colors.orange,
  Colors.yellow
];

class AppTheme {

  final int selectedColor;
  final bool isDarkMode;

  const AppTheme({
    this.selectedColor = 0,
    this.isDarkMode = false, 
  }): assert(selectedColor >= 0, 'Selected color should be greater than 0'),
      assert(selectedColor < colorList.length, 'Selected color should be smallest than ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
    colorSchemeSeed: colorList[selectedColor],
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    appBarTheme: const AppBarTheme(
      centerTitle: false
    )
  );


  AppTheme copyWith({ int? selectedColor, bool? isDarkMode }) {
    return AppTheme(
      selectedColor: selectedColor ?? this.selectedColor,
      isDarkMode: isDarkMode ?? this.isDarkMode 
    );
  }
}