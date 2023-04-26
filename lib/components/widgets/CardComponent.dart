import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_movie/config/helper/size_extension.dart';

import 'ImageComponent.dart';

class CardComponent extends StatelessWidget {
  String urlImg;
  String titulo;

  CardComponent({Key? key, required this.urlImg, required this.titulo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boxWidth = context.widthPercent(.38);
    final boxHeight = context.heightPercent(.09);
    final backGroundColor = Colors.black45;

    return Container(
      width: boxWidth,
      height: boxHeight,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(28),
        ),
        color: backGroundColor,
      ),
      child: Padding(
        padding: EdgeInsets.all(0),
        child: Column(children: [
          ImageComponent(urlImg: urlImg, width: boxWidth, height: boxHeight),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 9),
              child: SizedBox(
                width: boxWidth * 1,
                height: boxHeight * .3,
                child: Text(
                  titulo,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.solid,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    overflow: TextOverflow.fade,
                  ),
                ),
              ))
        ]),
      ),
    );
  }
}
