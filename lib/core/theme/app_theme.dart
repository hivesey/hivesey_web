import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/media_info.dart';

final String fontFamily = 'Roboto';
final String fontFamilyThin = 'RobotoThin';
final String fontFamilyLight = 'RobotoLight';
final String fontFamilyMedium = 'RobotoMedium';

////Contemporary with green primary Theme ***************************************************************************************************
class Contemporary extends AbstractAppTheme {
  @override
  ThemeColors _createThemeColors() => super.themeColors ??= ThemeColors(
        primarySwatch: 0xFFFFFFFF,
        backgroundColor: Colors.white,
        backgroundColorLightOrDark: Color.fromRGBO(240, 247, 255, 1), //light blue #f0f7ff
        textColor: Colors.grey[900], //close to black
        textColorLightOrDark: Color.fromRGBO(52, 90, 127, 1), //dark blue #34597f
        primaryColor: Color.fromRGBO(105, 178, 255, 1), //blue 69B2FF
        primaryColorLightOrDark: Color.fromRGBO(94, 160, 229, 1), //next darket shade of primary color #5ea0e5
        primaryTextColor: Colors.white,
        secondaryColor: Color.fromRGBO(105, 178, 255, 1), //blue 69B2FF .. same as primary
        secondaryColorLightOrDark: Color.fromRGBO(94, 160, 229, 1), //next darket shade of primary color #5ea0e5 .. same as primary
        secondaryTextColor: Color.fromRGBO(94, 160, 229, 1), //next darket shade of primary color #5ea0e5 ... same as primary
        warnColor: Color.fromRGBO(138, 72, 63, 1), //red
        warnColorLightOrDark: Color.fromRGBO(88, 46, 41, 1), //red darker
        warnTextColor: Colors.white,
        lineColor: Color.fromRGBO(225, 239, 255, 1), //light blue #e1efff ... same as backgroundColorLightOrDark
        lineColorLightOrDark: Color.fromRGBO(225, 239, 255, 1), //light blue #e1efff ... same as backgroundColorLightOrDark or lineColor
        navigationStatusBarBrightness: Brightness.dark, // NA for web apps
        navigationStatusBarColor: Colors.white, // NA for web apps
      );

  @override
  Brightness getBrightness() => Brightness.light;

  @override
  ThemeData getTheme() => super._themeData ??= super._getTheme();
}

////AbstractAppTheme  ***************************************************************************************************
///base class for all theme implementation
abstract class AbstractAppTheme {
  ThemeColors themeColors;
  ThemeData _themeData;

  AbstractAppTheme() {
    themeColors = _createThemeColors();
  }

  //common ones
  ThemeColors _createThemeColors();
  ThemeData getTheme();
  Brightness getBrightness();

  ThemeData _getTheme() => ThemeData(
      brightness: getBrightness(),
      fontFamily: fontFamily,
      primarySwatch: _uniColorSwatch(
        themeColors.primarySwatch,
        themeColors.backgroundColor,
      )).copyWith(
      canvasColor: themeColors.backgroundColor, //default one .. like left over space in drawer etc
      primaryColor: themeColors.primaryColor,
      accentColor: themeColors.secondaryColor,
      //all containers and child widgets inherit this color by default
      scaffoldBackgroundColor: themeColors.backgroundColor,
      //text theme (primary and accent)
      textTheme: this._textTheme(),
      primaryTextTheme: this._textTheme(),
      //app bar theme
      appBarTheme: this._appBarTheme(),
      backgroundColor: themeColors.backgroundColor,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: themeColors.primaryColor,
        foregroundColor: themeColors.primaryTextColor,
        splashColor: themeColors.primaryColorLightOrDark,
        highlightElevation: 5,
      ),

      //FORM FIELD : START
      //textformfield and related widgets
      cursorColor: themeColors.textColorLightOrDark,
      //ios specific
      cupertinoOverrideTheme: CupertinoThemeData(
        primaryColor: themeColors.textColorLightOrDark,
      ),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: themeColors.lineColorLightOrDark),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: themeColors.lineColor),
        ),
        labelStyle: TextStyle(color: themeColors.textColorLightOrDark),
        errorStyle: TextStyle(color: themeColors.warnColor),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: themeColors.warnColor),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: themeColors.warnColorLightOrDark),
        ),
      ),
      focusColor: themeColors.textColorLightOrDark,
      //FORM FIELD : END

      popupMenuTheme: PopupMenuThemeData(
        color: themeColors.backgroundColor,
      ),
      bottomAppBarTheme: BottomAppBarTheme(
        elevation: 0,
      ),
      dialogTheme: DialogTheme(
        backgroundColor: themeColors.backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
      dividerColor: themeColors.lineColor,
      tooltipTheme: TooltipThemeData(
          decoration: BoxDecoration(
              color: themeColors.primaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ))),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: themeColors.warnColor,
        actionTextColor: themeColors.warnTextColor,
        elevation: 0,
      ));

  MaterialColor _uniColorSwatch(int primary, Color swatchColor) => MaterialColor(
        primary,
        {
          50: swatchColor,
          100: swatchColor,
          200: swatchColor,
          300: swatchColor,
          400: swatchColor,
          500: swatchColor,
          600: swatchColor,
          700: swatchColor,
          800: swatchColor,
          900: swatchColor
        },
      );

  Widget dismissibleBackground() => Container(
        color: themeColors.warnColor.withOpacity(0.70),
        child: Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
          child: Icon(
            Icons.delete,
            color: themeColors.warnTextColor,
          ),
        ),
      );

  AppBarTheme _appBarTheme() => AppBarTheme(
        color: Colors.transparent,
        iconTheme: IconThemeData(color: themeColors.primaryColor),
        elevation: 0,
        textTheme: _textTheme(),
      );

  AppBarCustomStyle appBarCustomStyle(BuildContext context) => AppBarCustomStyle(
        borderColor: themeColors.lineColor,
      );

  SafeAreaCustomStyle safeAreaCustomStyle(BuildContext context) => SafeAreaCustomStyle(color: themeColors.backgroundColor);

  ProgressIndicatorCustomStyle progressIndicatorCustomStyle(BuildContext context) => ProgressIndicatorCustomStyle(
        color: this.themeColors.primaryColor,
      );

  Map<DisplayType, double> _textScaleFactorMap = const {
    DisplayType.Size0: 1.1,
    DisplayType.Petite: 1,
    DisplayType.XXSmall: 1.10,
    DisplayType.XSmall: 1.10,
    DisplayType.Small: 1.15,
    DisplayType.Medium: 1.20,
    DisplayType.Large: 1.20,
    DisplayType.XLarge: 1.34,
    DisplayType.XXLarge: 1.5,
  };

  TextTheme _textTheme() {
    double scaleFactor = _textScaleFactorMap[MediaInfo.minDisplayType()];
    return TextTheme(
      headline1: TextStyle(fontSize: 112 * scaleFactor, fontFamily: fontFamily, letterSpacing: 0.0, color: themeColors.textColor),
      headline2: TextStyle(fontSize: 56 * scaleFactor, fontFamily: fontFamily, letterSpacing: 0.0, color: themeColors.textColor),
      headline3: TextStyle(fontSize: 45 * scaleFactor, fontFamily: fontFamily, letterSpacing: 0.0, color: themeColors.textColor),
      headline4: TextStyle(fontSize: 34 * scaleFactor, fontFamily: fontFamily, letterSpacing: 0.0, color: themeColors.textColor),
      headline5: TextStyle(fontSize: 24 * scaleFactor, fontFamily: fontFamily, letterSpacing: 0.0, color: themeColors.textColor),
      headline6: TextStyle(fontSize: 18 * scaleFactor, fontFamily: fontFamily, letterSpacing: 0.0, color: themeColors.textColor),
      subtitle1: TextStyle(fontSize: 16 * scaleFactor, fontFamily: fontFamily, letterSpacing: 0.0, color: themeColors.textColor),
      subtitle2: TextStyle(fontSize: 14 * scaleFactor, fontFamily: fontFamily, letterSpacing: 0.0, color: themeColors.textColor),
      bodyText1: TextStyle(fontSize: 14 * scaleFactor, fontFamily: fontFamily, letterSpacing: 0.0, color: themeColors.textColor),
      bodyText2: TextStyle(fontSize: 14 * scaleFactor, fontFamily: fontFamily, letterSpacing: 0.0, color: themeColors.textColor),
      caption: TextStyle(fontSize: 12 * scaleFactor, fontFamily: fontFamily, letterSpacing: 0.0, color: themeColors.textColor),
      button: TextStyle(fontSize: 14 * scaleFactor, fontFamily: fontFamily, letterSpacing: 0.0, color: themeColors.textColor),
      overline: TextStyle(fontSize: 10 * scaleFactor, fontFamily: fontFamily, letterSpacing: 0.0, color: themeColors.textColor),
    );
  }
}

////Custom theme classes  ***************************************************************************************************
class SafeAreaCustomStyle {
  final Color color;
  const SafeAreaCustomStyle({this.color});
}

class AppBarCustomStyle {
  final Color borderColor;
  const AppBarCustomStyle({this.borderColor});
}

class ProgressIndicatorCustomStyle {
  final Color color;
  const ProgressIndicatorCustomStyle({this.color});
}

////ThemeColors that all theme needs to use  ********************************************************************************
class ThemeColors {
  final int primarySwatch;
  final Color backgroundColor;
  final Color backgroundColorLightOrDark;
  final Color textColor;
  final Color textColorLightOrDark;

  final Color primaryColor;
  final Color primaryColorLightOrDark;
  final Color primaryTextColor;

  final Color secondaryColor;
  final Color secondaryColorLightOrDark;
  final Color secondaryTextColor;

  final Color warnColor;
  final Color warnColorLightOrDark;
  final Color warnTextColor;

  final Color lineColor;
  final Color lineColorLightOrDark;

  ///below attributes are specific to android
  final Color navigationStatusBarColor;
  final Brightness navigationStatusBarBrightness;

  const ThemeColors({
    @required this.primarySwatch,
    @required this.backgroundColor,
    @required this.backgroundColorLightOrDark,
    @required this.textColor,
    @required this.textColorLightOrDark,
    @required this.primaryColor,
    @required this.primaryColorLightOrDark,
    @required this.primaryTextColor,
    @required this.secondaryColor,
    @required this.secondaryColorLightOrDark,
    @required this.secondaryTextColor,
    @required this.warnColor,
    @required this.warnColorLightOrDark,
    @required this.warnTextColor,
    @required this.lineColor,
    @required this.lineColorLightOrDark,
    @required this.navigationStatusBarColor,
    @required this.navigationStatusBarBrightness,
  });

  ThemeColors copyWith({
    int primarySwatch,
    Color backgroundColor,
    Color backgroundColorLightOrDark,
    Color textColor,
    Color textColorLightOrDark,
    Color primaryColor,
    Color primaryColorLightOrDark,
    Color primaryTextColor,
    Color secondaryColor,
    Color secondaryColorLightOrDark,
    Color secondaryTextColor,
    Color warnColor,
    Color warnColorLightOrDark,
    Color warnTextColor,
    Color lineColor,
    Color lineColorLightOrDark,
    Color navigationStatusBarColor,
    Brightness navigationStatusBarBrightness,
  }) =>
      ThemeColors(
        primarySwatch: primarySwatch ??= this.primarySwatch,
        backgroundColor: backgroundColor ??= this.backgroundColor,
        backgroundColorLightOrDark: backgroundColorLightOrDark ??= this.backgroundColorLightOrDark,
        textColor: textColor ??= this.textColor,
        textColorLightOrDark: textColorLightOrDark ??= this.textColorLightOrDark,
        primaryColor: primaryColor ??= this.primaryColor,
        primaryColorLightOrDark: primaryColorLightOrDark ??= this.primaryColorLightOrDark,
        primaryTextColor: primaryTextColor ??= this.primaryTextColor,
        secondaryColor: secondaryColor ??= this.secondaryColor,
        secondaryColorLightOrDark: secondaryColorLightOrDark ??= this.secondaryColorLightOrDark,
        secondaryTextColor: secondaryTextColor ??= this.secondaryTextColor,
        warnColor: warnColor ??= this.warnColor,
        warnColorLightOrDark: warnColorLightOrDark ??= this.warnColorLightOrDark,
        warnTextColor: warnTextColor ??= this.warnTextColor,
        lineColor: lineColor ??= this.lineColor,
        lineColorLightOrDark: lineColorLightOrDark ??= this.lineColorLightOrDark,
        navigationStatusBarColor: navigationStatusBarColor ??= this.navigationStatusBarColor,
        navigationStatusBarBrightness: navigationStatusBarBrightness ??= this.navigationStatusBarBrightness,
      );
}
