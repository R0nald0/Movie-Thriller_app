import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class ImageComponent extends StatelessWidget {
  String urlImg;

  ImageComponent({Key? key,
   required this.urlImg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
     height: 200,
        child: Image(
          image:CachedNetworkImageProvider(urlImg),
           fit: BoxFit.contain,
        ),
    );
  }
}
