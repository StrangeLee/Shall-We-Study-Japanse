
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:shall_we_study_japanese/base/base_page.dart';
import 'package:shall_we_study_japanese/base/custom_text_style.dart';
import 'package:shall_we_study_japanese/base/util_widget.dart';

class AddPage extends BasePage {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends BaseState<AddPage> with BasicPage {

  TextEditingController originalController = TextEditingController();
  TextEditingController meaningController = TextEditingController();
  TextEditingController memoController = TextEditingController();

  @override
  String appbarTitle() {
    return '단어 등록하기';
  }

  @override
  Widget userBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _inputWidgets(),
          Column(
            children: [
              UtilWidget.roundedButton(
                child: PlatformText(
                  this.defaultText,
                ),
                function: () => _getInputResult(),
                radiusValue: 20.0,
              ),
              SizedBox(
                height: 20.0,
              )
            ],
          )
        ],
      )
    );
  }

  Widget _inputWidgets() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        UtilWidget.textField(
          controller: originalController,
          hintText: '원어',
          padding: EdgeInsets.all(8.0),
          textStyle: CustomTextStyle.defaultText,
          boxDecoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0)
            ),
            border: Border.all(
              color: Colors.black12,
              width: 1.0
            )
          )
        ),
        UtilWidget.textField(
          controller: meaningController,
          hintText: '뜻(의미)',
          padding: EdgeInsets.all(8.0),
          textStyle: CustomTextStyle.defaultText,
        ),
        UtilWidget.textField(
          controller: memoController,
          hintText: '메모',
          maxLines: 5,
          padding: EdgeInsets.all(8.0),
          textStyle: CustomTextStyle.defaultText,
        ),
      ],
    );
  }

  _getInputResult() {
    print('${originalController.text} & ${meaningController.text} & ${memoController.text} ');
  }
}
