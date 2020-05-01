import 'package:flutter/material.dart';

import '../../core/theme/abstract_style.dart';
import '../../core/widgets/xwidgets_barrel.dart';

enum PrimaryIconPosition { Start, End }

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
            _imageToTextSeperator(),
            Expanded(
              flex: 9,
              child: Container(
                padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                child: Column(
                  children: [
                    _titleText(),
                    Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 20)),
                    _detailsText(),
                  ],
                ),
              ),
            )
          ],
        ),
      );

  Widget _iconAtEnd() => Container(
        padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
        child: Row(
          children: <Widget>[
            _primaryAvatar(),
            Expanded(flex: 1, child: DashLine(color: super.getColors().primaryColor)),
            _imageToTextSeperator(),
            Expanded(
              flex: 9,
              child: Container(
                padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                child: Column(
                  children: [
                    _titleText(),
                    Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 20)),
                    _detailsText(),
                  ],
                ),
              ),
            )
          ],
        ),
      );
}

abstract class AbstractXCard extends StatelessWidget with AbstractStyle {
  final double avatarRadius = 65;
  final double detailTextLineSpacing = 1.8;
  final double imageToTextSeperatorHeight = 125;
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

  Widget _imageToTextSeperator() => Container(
        height: imageToTextSeperatorHeight,
        decoration: BoxDecoration(border: Border(left: BorderSide(color: super.getColors().lineColorLightOrDark))),
      );

  Widget _titleText() => Text(
        this.title,
        style: TextStyle(
          fontSize: super.getTextTheme().headline3.fontSize,
          color: super.getColors().primaryColorLightOrDark,
        ),
      );

  Widget _detailsText() => Text(
        this.details,
        textAlign: TextAlign.justify,
        style: TextStyle(
          fontSize: super.getTextTheme().subtitle1.fontSize,
          height: detailTextLineSpacing,
        ),
      );
}
