import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:shall_we_study_japanese/base/base_page.dart';
import 'package:shall_we_study_japanese/base/util_widget.dart';
import 'package:shall_we_study_japanese/model/word_note.dart';

class ListPage extends BasePage {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends BaseState<ListPage> with BasicPage {

  @override
  String appbarTitle() {
    return '단어 목록';
  }

  @override
  Widget userBody() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: this.provider.getWords,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var list = snapshot.data.toList();
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) => _wordListView(list[index]),
              );
            } else {
              return Center(
                child: PlatformCircularProgressIndicator(),
              );
            }
          },
        )
      ),
    );
  }

  Widget _wordListView(WordNote item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UtilWidget.textView(
                    text: item.originalWord,
                    textStyle: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                  UtilWidget.textView(
                    text: item.translationWord,
                    textStyle: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 5.0,),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 1.0
                )
              )
            ),
          )
        ],
      ),
    );
  }
}
