import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:the_movie/config/Config.dart';
import 'package:the_movie/model/Movie.dart';
import '../view/MovieDetalhesPage.dart';
import 'CardComponent.dart';

class ListMovieComponent extends StatelessWidget {
  List<Movie> listaFilmes ;
  final controller = ScrollController();

  ListMovieComponent(
      {Key? key, required this.listaFilmes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
         height:290,
        child: ListView.builder(
            controller: controller,
            scrollDirection: Axis.horizontal,
            itemCount: listaFilmes.length,
            itemBuilder: (context, index) {
              Movie movie =listaFilmes[index];

              return GestureDetector(
                onTap: (){
                  Get.to(()=>MovieDetalhesPage(movie: movie,));
                },
                child:  CardComponent(
                  urlImg: "${Config.BASE_URLIMG}${Config.BASE_URLIMG_SIZE}${movie.posterPath}",
                  titulo: movie.title!,
                ),
              );
            }),
    );
  }
}
