import 'package:flutter/material.dart';
import 'package:mafia/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      snackBarTheme: const SnackBarThemeData(
          contentTextStyle: TextStyle(fontFamily: 'Nahid')),
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.green,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
          //brightness: Brightness.dark,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(4)),
          minimumSize: MaterialStateProperty.all(const Size.fromHeight(48)),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
        isDense: true,
      ),
      fontFamily: 'Nahid',
      primarySwatch: Colors.green,
    );

    return MaterialApp(
      title: 'مافیا',
      theme: theme,
      home: const HomePage(),
      builder: (context, child) => Directionality(
        textDirection: TextDirection.rtl,
        child: child!,
      ),
    );
  }
}
