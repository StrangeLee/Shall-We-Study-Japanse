
import 'package:flutter/material.dart';
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
      textAlign: TextAlign.center,
    );
  }

  static Widget roundedButton({
    @required Widget child,
    @required Function function,
    @required double radiusValue,
    EdgeInsetsGeometry margin,
    EdgeInsetsGeometry padding,
  }) {
    return Container(
      margin: margin,
      child: FlatButton(
        child: child,
        onPressed: function,
        padding: padding,
        color: Colors.greenAccent,
        // color: Colors.lightGreenAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radiusValue)
          ),
          side: BorderSide(
            color: Colors.greenAccent,
            width: 3.0,
          ),
        ),
      ),
    );
  }

  static Widget defaultButton({
    @required Widget child,
    @required Function function,
    Color color,
  }) {
    return PlatformButton(
      child: child,
      onPressed: function,
      color: color,
    );
  }
}