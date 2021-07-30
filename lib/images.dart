import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';


class ImageSlider extends StatelessWidget {
  const ImageSlider({Key? key, required this.product}) : super(key: key);

  final String product ;

  @override
  Widget build(BuildContext context) {
    List images = [
      'assets/$product/$product 1.jpg',
      'assets/$product/$product 2.jpg',
      'assets/$product/$product 3.jpg',
    ];

    return Container(
      child: CarouselSlider(
        options: CarouselOptions(height: MediaQuery.of(context).size.height * 0.25,),
        items: images.map((imagePath) {
          return Builder(builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                  color: Color(0xffFF2E0680),
                boxShadow: [BoxShadow(
                color: Color(0xffFF2E0680),
                blurRadius: 20.0,
              ),]
              ),
              child: Image.asset(
                imagePath,
                fit: BoxFit.fill,
              ),
            );
          });
        }).toList(),
      ),
    );
  }
}
