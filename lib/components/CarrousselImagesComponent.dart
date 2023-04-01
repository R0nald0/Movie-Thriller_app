import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:the_movie/components/ImageComponent.dart';
class CarrousselImagesComponent extends StatelessWidget {
  const CarrousselImagesComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> imagens = [
      "https://files.tecnoblog.net/wp-content/uploads/2020/12/ordem-filmes-harry-potter-e1609427898909-700x393.jpg",
      "https://files.tecnoblog.net/wp-content/uploads/2020/12/ordem-filmes-harry-potter-2-700x367.jpg",
      "https://files.tecnoblog.net/wp-content/uploads/2022/04/batman.jpg"
    ];

   CarouselController();
    return CarouselSlider.builder(
      itemCount: imagens.length,
      itemBuilder: (context,int index, int pageIndex){
         final urlImage=imagens[index];
         return sliderImage(urlImage,index);
      },
      options: options(),
    );
  }


 Widget sliderImage(String url , int index){
   return Container(
     child: Image.network(url,fit: BoxFit.contain)
   );
  }

  CarouselOptions options(){
     return CarouselOptions(
       height:400,
       aspectRatio: 16/9,
       viewportFraction: 1.0,
       initialPage: 0,
       enableInfiniteScroll: true,
       autoPlay: true,
       scrollDirection: Axis.horizontal,
     );
  }

}
