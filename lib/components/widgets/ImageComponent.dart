import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:the_movie/config/helper/size_extension.dart';

class ImageComponent extends StatelessWidget {
  String urlImg;
  double width;
  double height;

  ImageComponent(
      {Key? key,
      required this.urlImg,
      required this.width,
      required this.height})
      : super(key: key);

  double imageWidth(double widthPercent) => this.width * widthPercent;
  double imageHeight(double heightPercent) => this.height * heightPercent;

  @override
  Widget build(BuildContext context) {
    final boxWidth = imageWidth(2);
    final boxHeight = imageHeight(3);
    return Container(
      height: boxHeight,
      width: boxWidth,
      child: Image(
        image: CachedNetworkImageProvider(urlImg),
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
