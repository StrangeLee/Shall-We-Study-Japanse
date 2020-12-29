import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter/material.dart';
import 'package:shall_we_study_japanese/base/base_page.dart';
import 'package:shall_we_study_japanese/base/util_widget.dart';
import 'package:shall_we_study_japanese/view/add_page.dart';
import 'package:shall_we_study_japanese/view/list_page.dart';
import 'package:shall_we_study_japanese/view/paint/custom_paint.dart';
import 'package:shall_we_study_japanese/view/setting_page.dart';
import 'package:shall_we_study_japanese/view/quiz_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: Container(
        color: Colors.greenAccent,
        child: CustomPaint(
          painter: BackgroundPainter(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UtilWidget.textView(
                  text: 'Learning Language',
                  textStyle: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _buttonList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonList() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _roundButton(
          '단어 외우기',
          () => _navPush(QuizPage()),
        ),
        _roundButton(
          '단어 관리',
          () => _navPush(AddPage()),
        ),
        _roundButton(
          '단어 목록',
          () => _navPush(ListPage()),
        ),
        _roundButton(
          '설정',
          () => _navPush(SettingPage()),
        ),
      ],
    );
  }

  Widget _roundButton(String text, Function function) {
    return UtilWidget.roundedButton(
      child: UtilWidget.textView(
        text: text,
        textStyle: TextStyle(
          fontSize: 28.0,
        )
      ),
      margin: EdgeInsets.all(5.0),
      padding: EdgeInsets.all(8.0),
      function: function,
      radiusValue: 5.0,
    );
  }

  _navPush(Widget page) {
    Navigator.of(context).push(platformPageRoute(context: context, builder: (context) => page,));
  }
}
