import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'home/home_barrel.dart';
import 'matchsey/matchsey_barrel.dart';

class Routes {
  static final FluroRouter _fluroRouter = FluroRouter();

  static Routes _instance = Routes._init();

  factory Routes() => _instance;

  static final String initialRoute = homeRoute;

  static final String homeRoute = '/';
  final Handler _home = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => HomeScreen());

  static final String matchseyRoute = '/matchsey';
  final Handler _matchsey = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) => MatchseyScreen());

  Routes._init() {
    _setUp();
  }

  _setUp() {
    _fluroRouter.define(homeRoute, handler: _home, transitionType: TransitionType.cupertino);
    _fluroRouter.define(matchseyRoute, handler: _matchsey, transitionType: TransitionType.cupertino);
  }

  dynamic generator() => _fluroRouter.generator;
}
