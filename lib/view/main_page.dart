import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:shall_we_study_japanese/base/base_page.dart';
import 'package:flutter/material.dart';
import 'package:shall_we_study_japanese/base/util_widget.dart';
import 'package:shall_we_study_japanese/view/paint/custom_paint.dart';

class MainPage extends BasePage {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends BaseState<MainPage> with BasicPage {

  @override
  String appbarTitle() {
    return '메인 화면';
  }

  @override
  Widget userBody() {
    return Container(
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
    );
  }

  Widget _buttonList() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _roundButton(
            '단어 외우기',
                () => print('abc')
        ),
        _roundButton(
            '단어 관리',
                () => print('abc')
        ),
        _roundButton(
            '단어 목록',
                () => print('abc')
        ),
        _roundButton(
            '설정',
                () => print('abc')
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
}
