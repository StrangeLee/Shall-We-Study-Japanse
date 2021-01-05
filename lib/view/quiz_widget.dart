import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shall_we_study_japanese/base/base_dialog.dart';
import 'package:shall_we_study_japanese/base/custom_text_style.dart';
import 'package:shall_we_study_japanese/base/util_function.dart';
import 'package:shall_we_study_japanese/base/util_widget.dart';
import 'package:shall_we_study_japanese/model/word_note.dart';
import 'package:shall_we_study_japanese/provider/word_memo_provider.dart';
import 'package:shall_we_study_japanese/view/main_page.dart';
import 'package:shall_we_study_japanese/view/quiz_page.dart';
import 'package:toast/toast.dart';

// Jan, 4, 2021 Todo : 문제 성공 시 화면 전환 및 완료 페이지 만들기

class QuizWidget extends StatefulWidget {
  final WordNote item;
  final int mark;

  const QuizWidget({Key key, this.item, this.mark}) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState(item, mark);
}

class _QuizWidgetState extends State<QuizWidget> {
  WordNote item;
  int mark;

  _QuizWidgetState(this.item, this.mark);

  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 300.0,
                  decoration: BoxDecoration(
                    color: Colors.lightGreenAccent,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: UtilWidget.textView(
                        text: item.originalWord,
                        textStyle: CustomTextStyle.quizText,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Container(
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: Colors.lightGreenAccent,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Center(
                    child: UtilWidget.textField(
                      controller: controller,
                      hintText: '정답 입력란',
                      padding: const EdgeInsets.all(8.0),
                      hintStyle: CustomTextStyle.answerText,
                      maxLines: 1,
                      align: TextAlign.center,
                      contentPadding: const EdgeInsets.all(8.0),
                      textStyle: CustomTextStyle.answerText,
                      boxDecoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: UtilWidget.roundedButton(
              child: UtilWidget.textView(text: '정답 확인하기'),
              function: () => _isAnswer(item.translationWord, controller.text),
              radiusValue: 20.0,
            ),
          ),
        ],
      ),
    );
  }

  _isAnswer(String correct, String answer) { // correct : 정답, answer : 답변,
    if (correct != answer) {
      Toast.show('삐빅 오답입니다.', context);
    } else {
      print('mark : ${this.mark}');
      var length = WordMemoProvider().getListSize + 1;

      if (this.mark < length) {
        UtilFunction.pushReplaceNavigator(
            context,
            QuizPage(
              marks: this.mark + 1,
            )
        );
      } else {
        BaseDialog.showNotifyDialog(
          context: context,
          title: 'You good boy',
          content: '문제를 모두 푸셨습니다.',
          function: () => UtilFunction.pushReplaceNavigator(context, MainPage()),
        );
      }
    }
  }
}
