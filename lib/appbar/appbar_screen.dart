import 'package:flutter/material.dart';
import '../routes.dart';

import '../core/theme/theme_barrel.dart';
import '../core/widgets/xwidgets_barrel.dart';
import 'appbar_barrel.dart';

typedef OnTextMenuTapped = void Function();

enum AppMenu { Home, Matchsey }

class AppBarScreen extends StatelessWidget with AbstractStyle {
  final AppMenu currentScreen;

  AppBarScreen({@required this.currentScreen});

  @override
  Widget build(BuildContext context) => _sliverAppBar(context);

  Widget _sliverAppBar(context) => SliverAppBar(
        title: SliverAppBarTitle(child: _titleOnShrink()),
        titleSpacing: 0,
        centerTitle: false,
        elevation: 1,
        backgroundColor: super.getColors().backgroundColor,
        expandedHeight: MediaInfo.percentOrDefaultHeight(10, minHeight: 100, maxHeight: 140),
        pinned: true,
        floating: true,
        snap: false,
        flexibleSpace: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(width: MediaInfo.gutterScreenWidth()),
              Expanded(flex: 4, child: _flexibleSPaceBar()),
              Expanded(
                flex: 6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: _menu(context),
                ),
              ),
              Container(width: MediaInfo.gutterScreenWidth())
            ],
          ),
        ),
      );

  ///title that appears on scroll or shrink
  Widget _titleOnShrink() => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(width: MediaInfo.gutterScreenWidth()),
          Container(
            constraints: BoxConstraints(maxHeight: 65),
            child: Image.asset(
              'images/hivesey-logo-512.png',
              fit: BoxFit.scaleDown,
            ),
          ),
          Text(
            'Hivesey',
            style: TextStyle(
              color: super.getColors().textColorLightOrDark,
              fontSize: super.getTextTheme().headline6.fontSize,
            ),
          ),
        ],
      );

  ///logo as it appears in expanded mode
  Widget _flexibleSPaceBar() => FlexibleSpaceBar(
          background: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Container(
          padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
          child: Image.asset(
            'images/hivesey-logo-512.png',
            fit: BoxFit.scaleDown,
          ),
        ),
      ));

  ///menu that both in expanded and shrink mode
  _menu(context) => <Widget>[
        Padding(padding: EdgeInsets.fromLTRB(25, 0, 0, 0)),
        _textMenuOption(
          displayText: 'Home',
          tooltip: 'Home Page',
          onTextMenuTapped: () => currentScreen != AppMenu.Home ? Navigator.of(context).pushNamed(Routes.homeRoute) : '',
        ),
        Padding(padding: EdgeInsets.fromLTRB(0, 0, 25, 0)),
        _textMenuOption(
          displayText: 'Matchsey',
          tooltip: 'Matchsey App',
          onTextMenuTapped: () => currentScreen != AppMenu.Matchsey ? Navigator.of(context).pushNamed(Routes.matchseyRoute) : '',
        ),
        Padding(padding: EdgeInsets.fromLTRB(0, 0, 15, 0)),
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
                  fontSize: super.getTextTheme().subtitle1.fontSize,
                ),
              ))));
}
