import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:shall_we_study_japanese/view/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final materialThemeData = ThemeData(
      primarySwatch: Colors.green,
      scaffoldBackgroundColor: Colors.white,
      accentColor: Colors.greenAccent,
      appBarTheme: AppBarTheme(color: Colors.green),
      primaryColor: Colors.green,
      secondaryHeaderColor: Colors.lightGreen,
      canvasColor: Colors.black,
      backgroundColor: Colors.white,
      textTheme: TextTheme().copyWith(body1: TextTheme().body1)
  );

  final cupertinoTheme = CupertinoThemeData(
      primaryColor: Colors.green,
      barBackgroundColor: Colors.greenAccent,
      scaffoldBackgroundColor: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return PlatformApp(
      debugShowCheckedModeBanner: false,
      title: 'Shall We Study Language?',
      home: MainPage(),
      material: (context, platform) => MaterialAppData(
        theme: materialThemeData
      ),
      cupertino: (context, platform) => CupertinoAppData(
        theme: cupertinoTheme
      ),
    );
  }
}

