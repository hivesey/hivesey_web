import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../core/theme/theme_barrel.dart';
import '../core/widgets/xwidgets_barrel.dart';

class MatchseyCarousel extends StatelessWidget with AbstractStyle {
  final double _screenWidthBreakpoint = 700;
  final double _maxWidthCarouselContainer = 500;
  final double _carouselHeight = 700.0;
  final double _imageWidth = 350;

  final CarouselController _carouselController = CarouselController();
  MatchseyCarousel();

  @override
  Widget build(BuildContext context) => MediaInfo.screenWidth > _screenWidthBreakpoint
      ? _forBigger()
      : Container(
          child: _build(),
        );

  Widget _forBigger() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _navigateButton(isLeft: true),
          Padding(padding: EdgeInsets.fromLTRB(5, 0, 45, 0)),
          Container(
            constraints: BoxConstraints(maxWidth: _maxWidthCarouselContainer),
            child: _build(),
          ),
          Padding(padding: EdgeInsets.fromLTRB(45, 0, 5, 0)),
          _navigateButton(isLeft: false),
        ],
      );

  Widget _navigateButton({bool isLeft}) => Center(
        child: XCursor(
          child: GestureDetector(
            onTap: () => isLeft
                ? this._carouselController.previousPage(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.bounceInOut,
                    )
                : this._carouselController.nextPage(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.bounceInOut,
                    ),
            child: Container(
              alignment: AlignmentDirectional.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: super.getColors().backgroundColor,
              ),
              child: Icon(
                isLeft ? Icons.keyboard_arrow_left : Icons.keyboard_arrow_right,
                color: Color.fromRGBO(195, 113, 102, 1),
                size: 35,
              ),
            ),
          ),
        ),
      );

  Widget _build() => CarouselSlider.builder(
        itemCount: 32,
        carouselController: _carouselController,
        options: CarouselOptions(
          height: _carouselHeight,
          enlargeCenterPage: true,
          carouselController: _carouselController,
          autoPlay: MediaInfo.screenWidth > _screenWidthBreakpoint ? false : true,
        ),
        itemBuilder: (BuildContext context, int itemIndex) => _imageSliders('$itemIndex.png'),
      );

  Widget _imageSliders(String imgNm) => Container(
        child: Container(
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  //Image.network(index, fit: BoxFit.cover, width: 1000.0),
                  Image.asset(
                    'images_matchsey/$imgNm',
                    fit: BoxFit.cover,
                    width: _imageWidth,
                  ),
                ],
              )),
        ),
      );
}
