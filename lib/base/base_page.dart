import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:provider/provider.dart';
import 'package:shall_we_study_japanese/provider/word_memo_provider.dart';

abstract class BasePage extends StatefulWidget {
  BasePage({Key key}) : super(key: key);
}

abstract class BaseState<Page extends BasePage> extends State<BasePage> {
  String appbarTitle();
}

mixin BasicPage<Page extends BasePage> on BaseState<Page> {

  static bool isFinalPage;

  String get defaultText => 'abc';

  WordMemoProvider provider;

  @override
  Widget build(BuildContext context) {
    isFinalPage = Navigator.canPop(context);
    provider = Provider.of<WordMemoProvider>(context, listen: false);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: PlatformScaffold(
        iosContentBottomPadding: false,
        iosContentPadding: false,
        appBar: _platformAppBar(),
        // bottomNavBar: platformBottomNavBar(),
        body: _body(),
      ),
    );
  }

  Widget _body() {
    return Container(
      color: Colors.white,
      child: userBody(),
    );
  }

  Widget _platformAppBar() {
    return PlatformAppBar(
      leading: Visibility(
        visible: isFinalPage,
        child: PlatformIconButton(
          material: (context, platform) => MaterialIconButtonData(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          cupertino: (context, platform) => CupertinoIconButtonData(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          padding: EdgeInsets.zero,
          onPressed: () => backPage(),
        ),
      ),
      title: Text(appbarTitle()),
    );
  }

  void naviPushReplacement(BasePage page) {
    Navigator.pushReplacement(
        context,
        platformPageRoute(
          context: context,
          builder: (context) => page,
        ));
  }

  void naviPush(BasePage page) {
    Navigator.push(
        context,
        platformPageRoute(
          context: context,
          builder: (context) => page,
        ));
  }

  Widget getImage(String path) {
    return Image.asset(
      path,
      fit: BoxFit.fitWidth,
    );
  }

  void backPage() {
    if (isFinalPage) {
      Navigator.pop(context);
    }
  }

  Widget userBody();
}
