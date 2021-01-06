import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:shall_we_study_japanese/base/base_page.dart';
import 'package:shall_we_study_japanese/base/util_widget.dart';

class SettingPage extends BasePage{
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends BaseState<SettingPage> with BasicPage {

  @override
  String appbarTitle() {
    return '';
  }

  @override
  List<Widget> trailingActions() {
    return null;
  }

  @override
  Widget userBody() {
    return Center(
      child: UtilWidget.textView(text: defaultText),
    );
  }
}
