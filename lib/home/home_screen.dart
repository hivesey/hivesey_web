import 'package:flutter/material.dart';
import 'package:hiveseyweb/appconstants.dart';

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
              Container(
                width: double.maxFinite,
                //constraints: BoxConstraints(maxWidth: AppConstants.maxWidth),
                height: 350,
                color: Colors.yellow,
                child: Align(alignment: Alignment.center, child: Text('main contents here')),
              ),
              Container(
                width: double.maxFinite,
                constraints: BoxConstraints(maxWidth: AppConstants.maxWidth),
                height: 350,
                color: Colors.blue,
                child: Align(alignment: Alignment.center, child: Text('main contents here')),
              ),
              Container(
                width: double.maxFinite,
                constraints: BoxConstraints(maxWidth: AppConstants.maxWidth),
                height: 350,
                color: Colors.green,
                child: Align(alignment: Alignment.center, child: Text('main contents here')),
              ),
              Container(
                width: double.maxFinite,
                constraints: BoxConstraints(maxWidth: AppConstants.maxWidth),
                height: 350,
                color: Colors.red,
                child: Align(alignment: Alignment.center, child: Text('main contents here')),
              )
            ])
          ],
        ),
      );

  //Widget _hiveseyWithStatement()
}
