import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:video_and_details_widget/main.dart';
import 'package:video_and_details_widget/videoplayer.dart';

class ImageSlider extends StatefulWidget {
  ImageSlider({Key? key, this.product}) : super(key: key);

  final product;

  @override
  ImageSliderState createState() => ImageSliderState(product);
}

class ImageSliderState extends State<ImageSlider> {


  final product;

  ImageSliderState(this.product);

  @override
  Widget build(BuildContext context) {
    List images = [
      'assets/$product/$product 1.jpg',
      'assets/$product/$product 2.jpg',
      'assets/$product/$product 3.jpg',
    ];

    return Container(
      child: CarouselSlider.builder(
        options: CarouselOptions(
          height: MediaQuery.of(context).size.height * 0.25,
        ),
        itemCount: images.length,
        itemBuilder: (BuildContext context, item, i) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(color: Color(0xff1c2834),
            ),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill, image: AssetImage(images[item])),
                borderRadius: BorderRadius.circular((20.0),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

}
