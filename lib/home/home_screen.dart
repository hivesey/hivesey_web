import 'package:flutter/material.dart';
import '../appconstants.dart';
import '../core/widgets/xwidgets_barrel.dart';

import '../core/theme/theme_barrel.dart';
import 'home_barrel.dart';

class HomeScreen extends StatelessWidget with AbstractStyle {
  const HomeScreen();

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
                  AppBarScreen(),
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
                child: _hi(),
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 25, 0, 25)),
              Container(
                constraints: BoxConstraints(maxWidth: AppConstants.maxWidth),
                child: _hi1(),
              ),
              Padding(padding: EdgeInsets.fromLTRB(0, 25, 0, 25)),
              Container(
                constraints: BoxConstraints(maxWidth: AppConstants.maxWidth),
                child: _hi(),
              ),
            ])
          ],
        ),
      );

  Widget _hi() => XCardHorz(
        primaryIconImagePath: 'images/rt-vin.png',
        title: 'hi',
        details:
            'We are web developers. Our first piece of code was  “linked list in C” about 25 years ago. As the saying goes “life happens as you are busy making other plans”. During this time we enjoyed designing and developing many web applications, apps for startups and fortune 500 companies. We want to use everything we have to get really creative in our hive',
        iconPosition: PrimaryIconPosition.Start,
      );

  Widget _hi1() => XCardHorz(
        primaryIconImagePath: 'images/rt-vin.png',
        title: 'hi',
        details:
            'We are web developers. Our first piece of code was  “linked list in C” about 25 years ago. As the saying goes “life happens as you are busy making other plans”. During this time we enjoyed designing and developing many web applications, apps for startups and fortune 500 companies. We want to use everything we have to get really creative in our hive',
        iconPosition: PrimaryIconPosition.End,
      );

  /// title, caption and image with mountains
  Widget _titleWithImage() => Container(
        width: double.maxFinite,
        padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
        color: super.getColors().primaryColor,
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
                'images/mountains.png',
                fit: BoxFit.scaleDown,
              ),
            )
          ],
        ),
      );

  List<Widget> _titleWithDesc() => [
        Text(
          'H i v e s e y',
          style: TextStyle(
            fontSize: super.getTextTheme().headline4.fontSize,
            color: super.getColors().backgroundColorLightOrDark,
          ),
        ),
        Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20)),
        Text(
          'pronounced as hive-C is our small creative hub.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: super.getTextTheme().headline6.fontSize,
            color: super.getColors().textColorLightOrDark,
            fontWeight: FontWeight.w500,
          ),
        )
      ];
}
