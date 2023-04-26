import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:the_movie/data/repository/MovieRepository.dart';
import 'package:the_movie/data/service/ApiTheMovieService.dart';
import '../components/widgets/CarrousselImagesComponent.dart';
import '../components/widgets/ListMovieComponent.dart';
import '../controller/HomePageController.dart';
import '../model/ListsModel.dart';
import 'ListMoviePage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final movieController = Get.find<HomePageControllerController>();

    return LayoutBuilder(builder: (context, constraint) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Movie Thriller"),
        ),
        body: Container(
            color: Colors.black45,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: _slideMovie(),
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  flex: 2,
                  child: Obx(() => movieController.moviesListsMovies.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          itemCount: movieController.moviesListsMovies.length,
                          itemBuilder: (BuildContext context, int index) {
                            ListModel item =
                                movieController.moviesListsMovies[index];
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        "${item.titleList}",
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Get.to(() =>
                                              ListMoviePage(modelList: item));
                                        },
                                        child: Text("Veja mais"))
                                  ],
                                ),
                                ListMovieComponent(
                                  listaFilmes: item.getlistMovie,
                                ),
                              ],
                            );
                          },
                        )),
                )
              ],
            )),
      );
    });
  }

  Widget _slideMovie() => Container(
        margin: const EdgeInsets.all(8),
        child: CarrousselImagesComponent(),
      );
}
