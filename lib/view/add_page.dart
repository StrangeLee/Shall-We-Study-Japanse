
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:shall_we_study_japanese/base/base_dialog.dart';
import 'package:shall_we_study_japanese/base/base_page.dart';
import 'package:shall_we_study_japanese/base/custom_text_style.dart';
import 'package:shall_we_study_japanese/base/util_widget.dart';
import 'package:shall_we_study_japanese/view/main_page.dart';

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
  List<Widget> trailingActions() {
    return null;
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
                  '등록하기',
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
        _textField(
          hint: '원어',
          controller: originalController,
        ),
        _textField(
          hint: '뜻(의미)',
          controller: meaningController,
        ),
        _textField(
          hint: '메모',
          controller: memoController,
          maxLines: 5,
        ),
      ],
    );
  }

  Widget _textField({
    @required String hint,
    @required  TextEditingController controller,
    int maxLines
  }) {
    return UtilWidget.textField(
        controller: controller,
        hintText: hint,
        padding: EdgeInsets.all(8.0),
        hintStyle: CustomTextStyle.defaultText,
        maxLines: maxLines,
        boxDecoration: BoxDecoration(
            borderRadius: BorderRadius.all(
                Radius.circular(10.0)
            ),
            border: Border.all(
                color: Colors.black12,
                width: 1.0
            )
        )
    );
  }

  // 등록하기 버튼 onPress Event
  _getInputResult() {
    print('${originalController.text} & ${meaningController.text} & ${memoController.text} ');

    bool isNull = this.provider.checkNullWords(
      original: originalController.text,
      meaning: meaningController.text,
      memo: memoController.text,
    );

    if (isNull) {
      BaseDialog.showNotifyDialog(
        context: context,
        title: '알림',
        content: '기입하지 않은 항목이 있습니다.\n확인해주세요.',
      );
    } else {
      BaseDialog.showNotifyDialog(
        context: context,
        title: '알림',
        content: '단어를 추가하였습니다.',
        function: () => this.naviPushReplacement(MainPage())
      );
    }
  }
}
