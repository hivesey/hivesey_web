import 'package:flutter/material.dart';
import '../../core/theme/theme_barrel.dart';

import '../../core/widgets/xwidgets_barrel.dart';

enum PrimaryIconPosition { Start, End }

class XCard {
  final double breakpoint;
  const XCard({@required this.breakpoint});

  AbstractXCard get({
    @required primaryIconImagePath,
    @required title,
    @required details,
    @required iconPosition,
  }) =>
      MediaInfo.screenWidth < this.breakpoint
          ? XCardVert(primaryIconImagePath: primaryIconImagePath, title: title, details: details, iconPosition: iconPosition)
          : XCardHorz(primaryIconImagePath: primaryIconImagePath, title: title, details: details, iconPosition: iconPosition);
}

class XCardHorz extends AbstractXCard {
  const XCardHorz({
    @required primaryIconImagePath,
    @required title,
    @required details,
    @required iconPosition,
  }) : super(primaryIconImagePath: primaryIconImagePath, title: title, details: details, iconPosition: iconPosition);

  @override
  Widget build(BuildContext context) => iconPosition == PrimaryIconPosition.Start ? _iconAtStart() : _iconAtEnd();

  Widget _iconAtStart() => Container(
        padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
        child: Row(
          children: <Widget>[
            _primaryAvatar(),
            Expanded(flex: 1, child: DashLine(color: super.getColors().primaryColor)),
            _imageToTextSeperator(isToLeft: true),
            _titleAndDetails(),
          ],
        ),
      );

  Widget _iconAtEnd() => Container(
        padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
        child: Row(
          children: <Widget>[
            _titleAndDetails(),
            _imageToTextSeperator(isToLeft: true),
            Expanded(flex: 1, child: DashLine(color: super.getColors().primaryColor)),
            _primaryAvatar(),
          ],
        ),
      );

  Widget _titleAndDetails() => Expanded(
        flex: 9,
        child: Container(
          padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
          child: Column(
            children: [
              _title(iconPosition == PrimaryIconPosition.Start ? TextAlign.left : TextAlign.right),
              Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 20)),
              _details(),
            ],
          ),
        ),
      );
}

class XCardVert extends AbstractXCard {
  const XCardVert({
    @required primaryIconImagePath,
    @required title,
    @required details,
    @required iconPosition,
  }) : super(primaryIconImagePath: primaryIconImagePath, title: title, details: details, iconPosition: iconPosition);

  @override
  Widget build(BuildContext context) => _build();

  Widget _build() => Container(
        padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
        child: Column(
          children: <Widget>[
            _primaryAvatar(),
            Container(
              width: 80,
              child: DashLine(
                color: super.getColors().primaryColor,
                orientation: DashLineOrientation.DashVert,
              ),
            ),
            _imageToTextSeperator(isToLeft: false),
            _titleAndDetails(),
          ],
        ),
      );

  Widget _titleAndDetails() => Container(
        padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
        child: Column(
          children: [
            _title(TextAlign.center),
            Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 20)),
            _details(),
          ],
        ),
      );
}

abstract class AbstractXCard extends StatelessWidget with AbstractStyle {
  final double avatarRadius = 65;
  final double detailTextLineSpacing = 1.8;
  final double imageToTextSeperatorHeight = 150;
  final double imageToTextSeperatorWidth = 225;
  final PrimaryIconPosition iconPosition;

  final String primaryIconImagePath;
  final String title;
  final String details;

  const AbstractXCard({@required this.primaryIconImagePath, @required this.title, @required this.details, @required this.iconPosition});

  Widget _primaryAvatar() => CircleAvatar(
        radius: avatarRadius,
        backgroundColor: super.getColors().lineColor,
        backgroundImage: AssetImage(this.primaryIconImagePath),
      );

  Widget _imageToTextSeperator({bool isToLeft}) => Container(
        height: isToLeft ? imageToTextSeperatorHeight : 0,
        width: isToLeft ? 0 : imageToTextSeperatorWidth,
        decoration: BoxDecoration(
            border: isToLeft
                ? Border(left: BorderSide(color: super.getColors().lineColorLightOrDark))
                : Border(top: BorderSide(color: super.getColors().lineColorLightOrDark))),
      );

  Widget _title(TextAlign textAlign) => Container(
        width: double.maxFinite,
        child: Text(
          this.title,
          style: TextStyle(
            fontSize: super.getTextTheme().headline3.fontSize,
            color: super.getColors().primaryColorLightOrDark,
          ),
          textAlign: textAlign,
        ),
      );

  Widget _details() => Text(
        this.details,
        textAlign: TextAlign.justify,
        style: TextStyle(
          fontSize: super.getTextTheme().subtitle1.fontSize,
          height: detailTextLineSpacing,
        ),
      );
}
