import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:the_movie/components/CardComponent.dart';
import 'package:the_movie/components/VideoPlayer.dart';
import 'package:the_movie/controller/DetalhesPageController.dart';
import 'package:the_movie/model/ReviewItem.dart';
import '../components/TituloListComponent.dart';
import '../model/Genre.dart';
import '../model/Movie.dart';
import 'package:the_movie/config/Config.dart';

class MovieDetalhesPage extends StatelessWidget {
  Movie movie;
  MovieDetalhesPage({Key? key, required this.movie}) : super(key: key);
  var controller = Get.put(DetalhesPageController());

  @override
  Widget build(BuildContext context) {
    controller.getGenderList(movie);
    controller.getVideoTrailler(movie.id);
    controller.getMoviesSimilar(movie.id);
    controller.getMoviesReview(movie.id);

    return Scaffold(
      appBar: AppBar(
        title: Text("${movie.title}"),
      ),
      body: LayoutBuilder(
        builder: (BuildContext, BoxConstraints constraints) {
          return Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: constraints.maxHeight / 4,
                      child: Obx(() => controller.key.value == ""
                          ? Center(child: CircularProgressIndicator(),)
                          : VideoPlayer(movieTrailler: controller.key.value))),
                  TituloListComponent(titulo:"Generos",),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: constraints.maxHeight / 15,
                      width: constraints.maxWidth / 1,
                      child: Obx(() => ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.moviesListGenders.length,
                            itemBuilder: (context, index) {
                              Genre genero =
                                  controller.moviesListGenders[index];
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(32),
                                  color: Colors.black12,
                                ),
                                padding: const EdgeInsets.all(10),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  "${genero.name}",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              );
                            },
                          )),
                    ),
                  ),
                  TituloListComponent(titulo: 'Descricão',),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      movie.overview.toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  TituloListComponent(titulo: "Filmes Similares",),
                  Container(
                    height: constraints.maxHeight /2.1,
                    child: Obx(
                      () => ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.moviesSimilarsList.length,
                          itemBuilder: (_, index) {
                            Movie itemMovie = controller.moviesSimilarsList[index];
                            return GestureDetector(
                              onTap: () {
                                 Get.off(() => MovieDetalhesPage(movie: itemMovie),preventDuplicates: false);
                              },
                              child: CardComponent(
                                urlImg:
                                    "${Config.BASE_URLIMG}${Config.BASE_URLIMG_SIZE}${itemMovie.posterPath}",
                                titulo: "${itemMovie.title}",
                              ),
                            );
                          },
                        ),

                    ),
                  ),
                  TituloListComponent(titulo: 'Reviews',),
                  Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                           child: Obx(() => Container(
                             height:controller.moviesReviews.length == 0
                                  ? constraints.maxHeight/8
                                  : constraints.maxHeight /1.6,
                             child: controller.moviesReviews.length == 0
                                 ? Center(child: Text("Nenhuma Review para o filme ${movie.title}"),)
                                  :ListView.builder(
                                     shrinkWrap: true,
                                     itemCount: controller.moviesReviews.length,
                                     itemBuilder: (context,index){
                                     Results results = controller.moviesReviews[index];
                                     print(" MOVIES --- ${controller.moviesReviews.length}");

                                   return ListTile(
                                      title:Text("Review por: ${results.author}"),
                                      subtitle: Text("${results.content}"),
                                 );
                               },
                             ),
                           )

                             ,),),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
