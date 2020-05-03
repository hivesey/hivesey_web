import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../core/theme/theme_barrel.dart';

class MatchseyCarousel extends StatelessWidget with AbstractStyle {
  const MatchseyCarousel();

  @override
  Widget build(BuildContext context) => Container(
        constraints: BoxConstraints(maxWidth: 500),
        child: _build(),
      );

  Widget _build() => CarouselSlider.builder(
        itemCount: 32,
        options: CarouselOptions(
          height: 800.0,
          enlargeCenterPage: true,
        ),
        itemBuilder: (BuildContext context, int itemIndex) => _imageSliders(
          '$itemIndex.png',
          _images['{$itemIndex}.png'],
        ),
      );

  Widget _imageSliders(String imgNm, String desc) => Container(
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
                    width: 350,
                  ),
                  Text(
                    '$imgNm - $desc',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: super.getColors().primaryTextColor,
                    ),
                  ),
                ],
              )),
        ),
      );

  final Map<String, String> _images = const {
    '1.png': 'Desc here...',
    '2.png': 'Desc here...',
    '3.png': 'Desc here...',
    '4.png': 'Desc here...',
    '5.png': 'Desc here...',
    '6.png': 'Desc here...',
    '7.png': 'Desc here...',
    '8.png': 'Desc here...',
    '9.png': 'Desc here...',
    '10.png': 'Desc here...',
    '11.png': 'Desc here...',
    '12.png': 'Desc here...',
    '13.png': 'Desc here...',
    '14.png': 'Desc here...',
    '15.png': 'Desc here...',
    '16.png': 'Desc here...',
    '17.png': 'Desc here...',
    '18.png': 'Desc here...',
    '19.png': 'Desc here...',
    '20.png': 'Desc here...',
    '21.png': 'Desc here...',
    '22.png': 'Desc here...',
    '23.png': 'Desc here...',
    '24.png': 'Desc here...',
    '25.png': 'Desc here...',
    '26.png': 'Desc here...',
    '27.png': 'Desc here...',
    '28.png': 'Desc here...',
    '29.png': 'Desc here...',
    '30.png': 'Desc here...',
    '31.png': 'Desc here...',
    '32.png': 'Desc here...',
    '33.png': 'Desc here...',
  };
}
