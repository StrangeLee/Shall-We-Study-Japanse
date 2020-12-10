import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:shall_we_study_japanese/base/base_page.dart';
import 'package:shall_we_study_japanese/base/custom_text_style.dart';
import 'package:shall_we_study_japanese/base/util_widget.dart';

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
    return Center(
      child: UtilWidget.textView(
        text: 'main page'
      ),
    );
  }
}
