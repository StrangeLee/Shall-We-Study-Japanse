
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class UtilFunction {

  static void pushNavigator(BuildContext context, Widget page) {
    Navigator.push(
        context,
        platformPageRoute(
          context: context,
          builder: (context) => page,
        ));
  }

  static void pushReplaceNavigator(BuildContext context, Widget page) {
    Navigator.pushReplacement(
        context,
        platformPageRoute(
          context: context,
          builder: (context) => page,
        ));
  }
}