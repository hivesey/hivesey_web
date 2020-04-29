import 'package:flutter/material.dart';

import 'theme_barrel.dart';

mixin AbstractStyle {
  ThemeData getTheme() => ThemeModule().get<Contemporary>().getTheme();
  TextTheme getTextTheme() => getTheme().textTheme;
  ThemeColors getColors() => ThemeModule().get<Contemporary>().themeColors;
}
