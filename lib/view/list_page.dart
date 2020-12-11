
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:shall_we_study_japanese/base/base_page.dart';
import 'package:shall_we_study_japanese/base/util_widget.dart';

class ListPage extends BasePage {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends BaseState<ListPage> with BasicPage {

  @override
  String appbarTitle() {
    return '';
  }

  @override
  Widget userBody() {
    return Center(
      child: UtilWidget.textView(text: defaultText),
    );
  }
}
