import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:shall_we_study_japanese/base/base_page.dart';
import 'package:shall_we_study_japanese/model/word_note.dart';
import 'package:shall_we_study_japanese/view/quiz_widget.dart';


class QuizPage extends BasePage {
  final int marks;

  QuizPage({this.marks});

  @override
  _QuizPageState createState() => _QuizPageState(marks: marks);
}

class _QuizPageState extends BaseState<QuizPage> with BasicPage {
  int marks;

  _QuizPageState({this.marks});

  @override
  String appbarTitle() {
    return '단어 외우기';
  }

  @override
  List<Widget> trailingActions() {
    return null;
  }

  @override
  Widget userBody() {
    return FutureBuilder(
      future: this.provider.getFutureWords,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<WordNote> list = this.provider.getWords;
          return Center(
              child: QuizWidget(
                item: list[marks],
                mark: this.marks,
              )
          );
        } else {
          return Center(
            child: PlatformCircularProgressIndicator(),
          );
        }
      },
    );
  }
}
