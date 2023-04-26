import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:the_movie/components/widgets/ListMovieComponent.dart';
import 'package:the_movie/controller/DetalhesPageController.dart';
import 'package:the_movie/model/ReviewItem.dart';
import '../components/widgets/CardComponent.dart';
import '../components/widgets/TituloListComponent.dart';
import '../components/widgets/VideoPlayer.dart';
import '../components/widgets/genre_card.dart';
import '../model/Genre.dart';
import '../model/Movie.dart';
import 'package:the_movie/config/Config.dart';

class MovieDetalhesPage extends StatelessWidget {
  final movie;
  MovieDetalhesPage({Key? key, required this.movie}) : super(key: key);
  var controller = Get.put(DetalhesPageController());

  @override
  Widget build(BuildContext context) {
    controller.getGenderList(movie);
    controller.getVideoTrailler(movie.id);
    controller.getMoviesSimilar(movie.id);
    controller.getMoviesReview(movie.id);

    return LayoutBuilder(
      builder: (BuildContext, BoxConstraints constraints) {
        return Scaffold(
            appBar: AppBar(
              title: Text("${movie.title}"),
            ),
            body: Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: constraints.maxHeight / 4,
                        child: Obx(() => controller.key.value == ""
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : VideoPlayer(
                                movieTrailler: controller.key.value))),
                    TituloListComponent(
                      titulo: "Generos",
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: constraints.maxHeight * 0.06,
                        width: constraints.maxWidth * 1,
                        child: Obx(
                          () => ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.moviesListGenders.length,
                            itemBuilder: (_, index) {
                              Genre genero =
                                  controller.moviesListGenders[index];
                              return GenreCard(
                                genre: genero,
                              );
                            },
                          ),
                        ),
                      ),
                      /*    Expanded(child: ListView.builder(
                        itemBuilder: (_,index){
                            final genres = [Genre(id: 1,name: "acao"),Genre(id: 1,name: "Suspense")];
                             return GenreCard(genre: genres[index],);
                        },) */
                    ),
                    TituloListComponent(
                      titulo: 'Descricão',
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        movie.overview.toString(),
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    TituloListComponent(
                      titulo: "Filmes Similares",
                    ),
                    Container(
                      height: constraints.maxHeight * .38,
                      child: Obx(() => ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.moviesSimilarsList.length,
                                itemBuilder: (_, index) {
                                  Movie itemMovie =
                                      controller.moviesSimilarsList[index];
                                  return GestureDetector(
                                    onTap: () {
                                      Get.off(
                                          () => MovieDetalhesPage(
                                              movie: itemMovie),
                                          preventDuplicates: false);
                                    },
                                    child: CardComponent(
                                      urlImg:
                                          "${Config.BASE_URLIMG}${Config.BASE_URLIMG_SIZE}${itemMovie.posterPath}",
                                      titulo: "${itemMovie.title}",
                                    ),
                                  );
                                },
                              )
                          /*  ListMovieComponent(
                                listaFilmes: controller.moviesSimilarsList), */
                          ),
                    ),
                    TituloListComponent(
                      titulo: 'Reviews',
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      child: Obx(
                        () => Container(
                          height: controller.moviesReviews.length == 0
                              ? constraints.maxHeight / 8
                              : constraints.maxHeight / 1.6,
                          child: controller.moviesReviews.length == 0
                              ? Center(
                                  child: Text(
                                      "Nenhuma Review para o filme ${movie.title}"),
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: controller.moviesReviews.length,
                                  itemBuilder: (context, index) {
                                    Results results =
                                        controller.moviesReviews[index];

                                    return ListTile(
                                      title:
                                          Text("Review por: ${results.author}"),
                                      subtitle: Text("${results.content}"),
                                    );
                                  },
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
