import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:shall_we_study_japanese/base/base_page.dart';
import 'package:shall_we_study_japanese/base/util_widget.dart';

class WordPage extends BasePage {
  @override
  _WordPageState createState() => _WordPageState();
}

class _WordPageState extends BaseState<WordPage> with BasicPage {

  @override
  String appbarTitle() {
    return '단어 외우기';
  }

  @override
  Widget userBody() {
    print(this.provider.getWords.toString());
    return Center(
      child: UtilWidget.textView(
        text: this.defaultText,
      ),
    );
  }
}
