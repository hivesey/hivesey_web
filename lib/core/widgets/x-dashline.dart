import 'package:flutter/material.dart';
import '../../core/theme/theme_barrel.dart';

enum DashLineOrientation { DashHorz, DashVert }

class DashLine extends StatelessWidget with AbstractStyle {
  final double height;
  final Color color;
  final DashLineOrientation orientation;

  const DashLine({@required this.color, this.orientation: DashLineOrientation.DashHorz, this.height = 1});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        final dashWidth = 10.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return Container(
              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              child: RotatedBox(
                quarterTurns: _isHorz() ? 0 : 1,
                child: SizedBox(
                  width: dashWidth,
                  height: dashHeight,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: color),
                  ),
                ),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          direction: _isHorz() ? Axis.horizontal : Axis.vertical,
        );
      },
    );
  }

  bool _isHorz() => orientation == DashLineOrientation.DashHorz;
}
