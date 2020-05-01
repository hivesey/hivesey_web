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

  Widget _hi() {
    return Container(
      width: double.maxFinite,
      constraints: BoxConstraints(
        maxWidth: AppConstants.maxWidth,
        minHeight: 350,
      ),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 65,
            backgroundColor: super.getColors().lineColor,
            child: CircleAvatar(
              radius: 63,
              backgroundColor: super.getColors().lineColor,
              backgroundImage: AssetImage('images/rt-vin.png'),
            ),
          ),
          Expanded(flex: 1, child: DashLine(color: super.getColors().primaryColor)),
          Container(
            height: 125,
            decoration: BoxDecoration(border: Border(left: BorderSide(color: super.getColors().lineColorLightOrDark))),
          ),
          Expanded(
            flex: 9,
            child: Container(
              padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
              child: Column(
                children: [
                  Text(
                    'hi',
                    style: TextStyle(
                      fontSize: super.getTextTheme().headline3.fontSize,
                      color: super.getColors().primaryColorLightOrDark,
                    ),
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 20)),
                  Text(
                    'We are web developers. Our first piece of code was  “linked list in C” about 25 years ago. As the saying goes “life happens as you are busy making other plans”. During this time we enjoyed designing and developing many web applications, apps for startups and fortune 500 companies. We want to use everything we have to get really creative in our hive',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: super.getTextTheme().subtitle1.fontSize,
                      height: 1.8,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  /// title, caption and image with mountains
  Widget _titleWithImage() => Container(
        width: double.maxFinite,
        padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
        color: super.getColors().primaryColor,
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            ),
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

  Widget _body() => SliverList(
        delegate: SliverChildListDelegate(
          [
            Column(children: [
              _titleWithImage(),
              Padding(padding: EdgeInsets.fromLTRB(0, 25, 0, 25)),
              _hi(),
              Padding(padding: EdgeInsets.fromLTRB(0, 25, 0, 25)),
              _hi(),
              Padding(padding: EdgeInsets.fromLTRB(0, 25, 0, 25)),
              _hi(),
            ])
          ],
        ),
      );

  //Widget _hiveseyWithStatement()
}
