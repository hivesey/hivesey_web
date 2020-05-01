import 'package:flutter/material.dart';

import '../../core/theme/abstract_style.dart';

class DotsDivider extends StatelessWidget with AbstractStyle {
  const DotsDivider();

  @override
  Widget build(BuildContext context) => _build();

  Widget _build() => Container(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: _dot(),
              padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
            ),
            Container(
              child: _dot(),
              padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
            ),
            Container(
              child: _dot(),
              padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
            )
          ],
        ),
      );

  Widget _dot() => Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: super.getColors().lineColorLightOrDark,
      ));
}
