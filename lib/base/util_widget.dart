
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:shall_we_study_japanese/base/custom_text_style.dart';

class UtilWidget {

  static Widget textView({
    @required String text,
    TextStyle textStyle,
  }) {
    if (textStyle == null) textStyle = CustomTextStyle.defaultText;

    return PlatformText(
      text,
      style: textStyle,
    );
  }
}