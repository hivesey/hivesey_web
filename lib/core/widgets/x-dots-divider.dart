import 'package:flutter/material.dart';

import '../../core/theme/abstract_style.dart';

class DotsDivider extends StatelessWidget with AbstractStyle {
  final Color color;
  final count;
  const DotsDivider({this.color, this.count});

  @override
  Widget build(BuildContext context) => _build();

  Widget _build() => Container(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _dots(),
        ),
      );

  List<Widget> _dots() => List.generate(
      this.count ?? 5,
      (index) => Container(
            child: _dot(),
            padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
          ));

  Widget _dot() => Container(
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: this.color ?? super.getColors().lineColorLightOrDark,
      ));
}
