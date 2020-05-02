import 'package:flutter/material.dart';

import '../appbar/appbar_barrel.dart';
import '../appconstants.dart';
import '../core/theme/theme_barrel.dart';
import '../core/widgets/xwidgets_barrel.dart';

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
                  AppBarScreen(currentScreen: AppMenu.Home),
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
              DotsDivider(),
              Container(
                constraints: BoxConstraints(maxWidth: AppConstants.maxWidth),
                child: XCursor(child: _iAmArathi()),
              ),
              DotsDivider(),
              Container(
                constraints: BoxConstraints(maxWidth: AppConstants.maxWidth),
                child: _vinayHere(),
              ),
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
            fontSize: super.getTextTheme().headline3.fontSize,
            color: super.getColors().backgroundColorLightOrDark,
          ),
        ),
        Padding(padding: EdgeInsets.fromLTRB(0, 0, 0, 20)),
        Container(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Text(
            'pronounced as hive-C is our small creative hub.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: super.getTextTheme().headline6.fontSize,
              color: super.getColors().textColorLightOrDark,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ];

  Widget _hi() => XCard(breakpoint: 700).get(
        primaryIconImagePath: 'images/rt-vin.png',
        title: 'hi',
        details:
            'We are web developers. Our first piece of code together was  “linked list in C” about 25 years ago. As the saying goes “life happens as you are busy making other plans”. During this time we enjoyed designing and developing many web applications, apps for startups and fortune 500 companies. We want to use everything we have to get really creative in our hive',
        iconPosition: PrimaryIconPosition.Start,
        titleColor: super.getColors().primaryColorLightOrDark,
      );

  Widget _iAmArathi() => XCard(breakpoint: 700).get(
        primaryIconImagePath: 'images/rt.png',
        title: 'i’m arathi',
        details:
            'I am a web developer with 17+ years of experience. Currently I am focused on mobile and web app development. I am passionate about creating meaningful and simple apps.',
        iconPosition: PrimaryIconPosition.End,
        titleColor: super.getColors().primaryColorLightOrDark,
      );

  Widget _vinayHere() => XCard(breakpoint: 700).get(
        primaryIconImagePath: 'images/vin.png',
        title: 'vinay here',
        details:
            'I am a chief architect working for a fortune 500 company. I have 20+ years of experience in designing and developing web applications. Always a full stack developer and an optimist to design & create simple and usable apps.',
        iconPosition: PrimaryIconPosition.Start,
        titleColor: super.getColors().primaryColorLightOrDark,
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
