import 'package:flutter/material.dart';

import '../core/theme/theme_barrel.dart';
import '../core/widgets/xwidgets_barrel.dart';

typedef OnTextMenuTapped = void Function();

class AppBarScreen extends StatelessWidget with AbstractStyle {
  @override
  Widget build(BuildContext context) => _sliverAppBar(context);

  Widget _sliverAppBar(context) => SliverAppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: super.getColors().backgroundColor,
        expandedHeight: MediaInfo.percentOrDefaultHeight(15, minHeight: 150),
        pinned: true,
        floating: true,
        snap: false,
        flexibleSpace: Container(
          //padding: EdgeInsets.fromLTRB(MediaInfo.gutterScreenWidth(), 0, MediaInfo.gutterScreenWidth(), 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(width: MediaInfo.gutterScreenWidth()),
              Expanded(child: _flexibleSPaceBar()),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: _menu(),
                ),
              ),
              Container(width: MediaInfo.gutterScreenWidth())
            ],
          ),
        ),
      );

  _menu() => <Widget>[
        Padding(padding: EdgeInsets.fromLTRB(25, 0, 0, 0)),
        _textMenuOption(displayText: 'Home', tooltip: 'Home Page', onTextMenuTapped: () => print('home tapped')),
        Padding(padding: EdgeInsets.fromLTRB(0, 0, 25, 0)),
        _textMenuOption(displayText: 'Matchsey', tooltip: 'Matchsey: App', onTextMenuTapped: () => print('matchsey tapped')),
        Padding(padding: EdgeInsets.fromLTRB(0, 0, 25, 0)),
      ];

  Widget _textMenuOption({String displayText, String tooltip, OnTextMenuTapped onTextMenuTapped}) => GestureDetector(
      onTap: onTextMenuTapped,
      child: XCursor(
          child: Tooltip(
              message: tooltip,
              child: Text(
                displayText,
                style: TextStyle(
                  color: super.getColors().textColorLightOrDark,
                  fontSize: super.getTextTheme().subtitle2.fontSize,
                ),
              ))));

  Widget _flexibleSPaceBar() => FlexibleSpaceBar(
          background: Container(
        padding: EdgeInsets.fromLTRB(10, 20, 0, 20),
        child: Align(
          alignment: AlignmentDirectional.centerStart,
          child: Image.asset(
            'images/hivesey-logo-512.png',
            fit: BoxFit.scaleDown,
          ),
        ),
      ));
}
