import 'package:flutter/material.dart';
import 'package:flutter_personal_money_app/view/main_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  /* //To not switch to landscape use this code below
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  */
  runApp(HomeApp());
}

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              labelLarge: TextStyle(
                color: Colors.purpleAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'QuickSand',
            fontSize: 22,
            fontWeight: FontWeight.w100,
            color: Colors.white,
          ),
          toolbarTextStyle: TextStyle(
            fontFamily: 'QuickSand',
            fontSize: 22,
            fontWeight: FontWeight.w100,
            color: Colors.white,
          ),
        ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple)
            .copyWith(secondary: Colors.deepPurpleAccent),
      ),
      home: MyApp(),
    );
  }
}
