import 'package:flutter/material.dart';

import '../appbar/appbar_barrel.dart';
import '../appconstants.dart';
import '../core/theme/theme_barrel.dart';
import '../core/widgets/xwidgets_barrel.dart';

class MatchseyScreen extends StatelessWidget with AbstractStyle {
  const MatchseyScreen();

  @override
  Widget build(BuildContext context) => _safeArea();

  Widget _safeArea() => Container(
        constraints: BoxConstraints(maxWidth: AppConstants.maxWidth),
        alignment: Alignment.bottomRight,
        color: Colors.black,
        child: SafeArea(
          child: Scaffold(
            body: Scrollbar(
              child: CustomScrollView(
                slivers: <Widget>[
                  AppBarScreen(currentScreen: AppMenu.Matchsey),
                  _body(),
                ],
              ),
            ),
          ),
        ),
      );

  Widget _body() => SliverList(
        delegate: SliverChildListDelegate(
          [
            Column(children: [
              _titleWithImage(),
              Padding(padding: EdgeInsets.fromLTRB(0, 25, 0, 25)),
              Container(
                constraints: BoxConstraints(maxWidth: AppConstants.maxWidth),
                child: _collaboration(),
              ),
              DotsDivider(),
              Padding(padding: EdgeInsets.fromLTRB(0, 25, 0, 25)),
              Container(
                child: footer(),
              ),
            ])
          ],
        ),
      );

  /// title, caption and image with mountains
  Widget _titleWithImage() => Container(
        width: double.maxFinite,
        padding: EdgeInsets.fromLTRB(0, 50, 0, 50),
        color: Color.fromRGBO(188, 97, 85, 0.9),
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ..._titleWithDesc(),
            Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 80)),
            Container(
              width: double.maxFinite,
              constraints: BoxConstraints(maxWidth: AppConstants.maxWidth - 150),
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'images/matchsey.png',
                fit: BoxFit.scaleDown,
              ),
            )
          ],
        ),
      );

  List<Widget> _titleWithDesc() => [
        Text(
          'M a t c h s e y',
          style: TextStyle(
            fontSize: super.getTextTheme().headline3.fontSize,
            color: super.getColors().backgroundColorLightOrDark,
          ),
        ),
        Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20)),
        Text(
          'A simple creative icon matching BRAIN game. Perfect for kids 4+ and adults alike.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: super.getTextTheme().headline6.fontSize,
            color: super.getColors().primaryTextColor,
            fontWeight: FontWeight.w500,
          ),
        )
      ];

  Widget _collaboration() => XCard(breakpoint: 700).get(
        primaryIconImagePath: 'images/family.png',
        title: 'collaboration',
        details: 'We really enjoyed developing this game with our kids. Lots of collaboration from ideas, design to quality checks.',
        iconPosition: PrimaryIconPosition.Start,
        titleColor: Color.fromRGBO(195, 113, 102, 1),
      );

  Widget footer() => Container(
        height: 75,
        width: double.maxFinite,
        color: super.getColors().secondaryColor,
        child: Center(
          child: Text(
            '© 2020 Hivesey. All rights reserved.',
            textAlign: TextAlign.center,
          ),
        ),
      );
}
