import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shall_we_study_japanese/base/custom_text_style.dart';
import 'package:shall_we_study_japanese/base/util_widget.dart';
import 'package:shall_we_study_japanese/model/word_note.dart';
import 'package:toast/toast.dart';

class QuizWidget extends StatefulWidget {
  final List<WordNote> list;

  const QuizWidget({Key key, this.list}) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState(list);
}

class _QuizWidgetState extends State<QuizWidget> {
  List<WordNote> list;

  _QuizWidgetState(this.list);

  TextEditingController controller = TextEditingController();

  PageController pageController;
  double pageScrollPosition = 1;

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      keepPage: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        var item = list[index];

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
      },
    );
  }

  _isAnswer(String correct, String answer) { // correct : 정답, answer : 답변,
    if (correct != answer) {
      Toast.show('삐빅 오답입니다.', context);
    } else {
      Toast.show('삐빅 정답입니다.', context);
    }
  }

  void updatePageState() {
    setState(() {
      pageScrollPosition = pageController.position.pixels.abs();
    });
  }
}
