import 'package:flutter/material.dart';

import '../../appconstants.dart';

/// singleton class as is not part of a injector, module
class MediaInfo {
  static double devicePixelRatio;
  static double aspectRatio;
  static double screenHeight;
  static double screenWidth;
  static double shortestSide;
  static double blockSizeHorizontal;
  static double blockSizeVertical;
  static double safeAreaHorizontal;
  static double safeAreaVertical;
  static double longestSide;

  static Size size;
  //setting device orientation
  static Future<void> setOrientationAndMediaQuery() async {
    /// this exception occured due to Flutter upgrade, "[ERROR:flutter/lib/ui/ui_dart_state.cc(157)]
    /// Unhandled Exception: ServicesBinding.defaultBinaryMessenger was accessed before the binding was initialized."
    /// and the below line is to solve it.
    WidgetsFlutterBinding.ensureInitialized();
    setMediaInfo();
  }

  static void setMediaInfo() {
    MediaQueryData mediaQueryData = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    devicePixelRatio = mediaQueryData.devicePixelRatio;
    aspectRatio = mediaQueryData.size.aspectRatio;
    screenWidth = mediaQueryData.size.width;
    screenHeight = mediaQueryData.size.height;
    shortestSide = mediaQueryData.size.shortestSide;
    longestSide = mediaQueryData.size.longestSide;
    size = mediaQueryData.size;

    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    safeAreaHorizontal = mediaQueryData.padding.left + mediaQueryData.padding.right;
    safeAreaVertical = mediaQueryData.padding.top + mediaQueryData.padding.bottom;

    if (AppConstants.devMode) print(MediaInfo.toPrint());
  }

  static String toPrint() {
    var dispTypeHorz = displayType(DisplayAxis.Horz);
    var dispTypeVert = displayType(DisplayAxis.Vert);
    return '''MediaInfo {
      devicePixelRatio: $devicePixelRatio, 
      aspectRatio: $aspectRatio, 
      screenHeight: $screenHeight, 
      screenWidth: $screenWidth, 
      size: $size, 
      shortestSide: $shortestSide,
      longestSide: $longestSide,
      blockSizeHorizontal: $blockSizeHorizontal,
      blockSizeVertical: $blockSizeVertical,
      safeAreaHorizontal: $safeAreaHorizontal,
      safeAreaVertical: $safeAreaVertical,
      dispTypeHorz: $dispTypeHorz,
      dispTypeVert: $dispTypeVert
    }''';
  }

  static double percentHeight(double height) => blockSizeVertical * height;
  static double percentWidth(double width) => blockSizeHorizontal * width;
  static double percentText(double size) => blockSizeHorizontal * size;

  //provide gutter based on max width .. equal on left and right
  static double gutterScreenWidth() => screenWidth > AppConstants.maxWidth ? (screenWidth - AppConstants.maxWidth) / 2 : 0;

  static double percentOrDefaultHeight(double percent, {double minHeight: 0, double maxHeight: 0}) {
    double ht = MediaInfo.percentHeight(percent);
    if (minHeight > 0 && MediaInfo.percentHeight(percent) < minHeight) {
      ht = minHeight;
    } else if (maxHeight > 0 && MediaInfo.percentHeight(percent) > maxHeight) {
      ht = maxHeight;
    }
    return ht;
  }

  static double percentOrDefaultWidth(double percent, {double minWidth: 0, double maxWidth: 0}) {
    double wd = MediaInfo.percentHeight(percent);
    if (minWidth > 0 && MediaInfo.percentHeight(percent) < minWidth) {
      wd = minWidth;
    } else if (maxWidth > 0 && MediaInfo.percentHeight(percent) > maxWidth) {
      wd = maxWidth;
    }
    return wd;
  }

  ///helper method and returns true if isPhoneSmall() or isPhoneXL()
  static bool isPhone() => shortestSide <= 500;

  static double _wOrH(DisplayAxis axis) => axis == DisplayAxis.Horz ? screenWidth : screenHeight;

  static bool _isPhoneSmall(DisplayAxis axis) => _wOrH(axis) <= 400;
  static bool _isPhoneXL(DisplayAxis axis) => _wOrH(axis) > 400 && _wOrH(axis) <= 500;

  static bool _isXXSmall(DisplayAxis axis) => _wOrH(axis) > 500 && _wOrH(axis) <= 600;
  static bool _isXSmall(DisplayAxis axis) => _wOrH(axis) > 600 && _wOrH(axis) <= 775;
  static bool _isSmall(DisplayAxis axis) => _wOrH(axis) > 775 && _wOrH(axis) <= 825;
  static bool _isMedium(DisplayAxis axis) => _wOrH(axis) > 825 && _wOrH(axis) <= 1000;
  static bool _isLarge(DisplayAxis axis) => _wOrH(axis) > 1000 && _wOrH(axis) <= 2000;
  static bool _isXLarge(DisplayAxis axis) => _wOrH(axis) > 2000 && _wOrH(axis) <= 2750;
  static bool isXXLarge(DisplayAxis axis) => _wOrH(axis) > 2750;

  static DisplayType displayType(DisplayAxis axis) {
    DisplayType displayType = DisplayType.XXLarge;
    if (_isPhoneSmall(axis)) {
      displayType = DisplayType.Size0;
    } else if (_isPhoneXL(axis)) {
      displayType = DisplayType.Petite;
    } else if (_isXXSmall(axis)) {
      displayType = DisplayType.XXSmall;
    } else if (_isXSmall(axis)) {
      displayType = DisplayType.XSmall;
    } else if (_isSmall(axis)) {
      displayType = DisplayType.Small;
    } else if (_isMedium(axis)) {
      displayType = DisplayType.Medium;
    } else if (_isLarge(axis)) {
      displayType = DisplayType.Large;
    } else if (_isXLarge(axis)) {
      displayType = DisplayType.XLarge;
    }
    return displayType;
  }

  static DisplayType displayTypeHorz() => displayType(DisplayAxis.Horz);
  static DisplayType displayTypeVert() => displayType(DisplayAxis.Vert);

  static DisplayType minDisplayType() => displayType(screenWidth > screenHeight ? DisplayAxis.Vert : DisplayAxis.Horz);
  static DisplayType maxDisplayType() => displayType(screenWidth > screenHeight ? DisplayAxis.Horz : DisplayAxis.Vert);
}

enum DisplayAxis { Horz, Vert }
enum DisplayType { Size0, Petite, XXSmall, XSmall, Small, Medium, Large, XLarge, XXLarge }
