import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:the_movie/config/Config.dart';
import 'package:the_movie/config/helper/size_extension.dart';
import 'package:the_movie/model/Movie.dart';

import '../../view/MovieDetalhesPage.dart';
import 'CardComponent.dart';

class ListMovieComponent extends StatelessWidget {
  List<Movie> listaFilmes;

  final controller = ScrollController();

  ListMovieComponent({Key? key, required this.listaFilmes}) : super(key: key);

  String getUrlImageLink(Movie movieName) {
    return "${Config.BASE_URLIMG}${Config.BASE_URLIMG_SIZE}${movieName.posterPath}";
  }

  String? getMovieName(Movie movie) {
    return movie.title != null ? movie.title : "Título";
  }

  @override
  Widget build(BuildContext context) {
    final height = context.heightPercent(.36);

    return Container(
      height: height,
      child: ListView.builder(
          controller: controller,
          scrollDirection: Axis.horizontal,
          itemCount: listaFilmes.length,
          itemBuilder: (context, index) {
            Movie movie = listaFilmes[index];

            return GestureDetector(
              onTap: () {
                Get.to(() => MovieDetalhesPage(
                      movie: movie,
                    ));
              },
              child: CardComponent(
                urlImg: getUrlImageLink(movie),
                titulo: getMovieName(movie)!,
              ),
            );
          }),
    );
  }
}
