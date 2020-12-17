
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class BaseDialog {

  static void showNotifyDialog({
    @required BuildContext context,
    @required String title,
    @required String content,
    Function function
  }) {
    showPlatformDialog(
      context: context,
      builder: (context) => PlatformAlertDialog(
        title: PlatformText(title),
        content: PlatformText(content),
        actions: [
          PlatformDialogAction(
            child: PlatformText('확인'),
            onPressed: () {
              Navigator.pop(context);
              function();
            },
          ),
        ],
      ),
    );
  }
}