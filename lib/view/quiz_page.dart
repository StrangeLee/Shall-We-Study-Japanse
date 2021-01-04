import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:shall_we_study_japanese/base/base_page.dart';
import 'package:shall_we_study_japanese/view/quiz_widget.dart';


class QuizPage extends BasePage {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends BaseState<QuizPage> with BasicPage {

  /// DEC, 29, 2020 TODO 1 : DB의 데이터가 처음에 제대로 호출되지 않는 버그 고치기 => progress indicator 를 통해 수정함.
  /// DEC, 29, 2020 TODO 2 : 문제를 풀때 IOS, Android 모두 메인페이지로의 이동을 막거나, 다이얼로그를 띄워 한번 더 확인하게 하기

  @override
  String appbarTitle() {
    return '단어 외우기';
  }

  @override
  Widget userBody() {;
    return FutureBuilder(
      future: this.provider.getWords,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var list = snapshot.data.toList();
          list.shuffle();
          return Center(
              child: QuizWidget(
                list: list,
                mark: 0,
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
