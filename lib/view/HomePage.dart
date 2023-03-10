import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:the_movie/components/CarrousselImagesComponent.dart';

import 'package:the_movie/repository/MovieRepository.dart';
import 'package:the_movie/components/ListMovieComponent.dart';

import '../controller/HomePageController.dart';
import '../model/ListsModel.dart';
import 'ListMoviePage.dart';

class HomePage extends StatelessWidget {
  final movieController = Get.put(HomePageControllerController());
   final movierepository = MovieRpository();
  @override
  Widget build(BuildContext context) {

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
                    child: Obx(
                      () => movieController.moviesListsMovies.isEmpty
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView.builder(
                              itemCount:movieController.moviesListsMovies.length ,
                              itemBuilder: (BuildContext context, int index) {
                                   ListModel item = movieController.moviesListsMovies[index];
                                   print("index ${item.titleList}");
                                  return Column(
                                    children: [
                                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                           Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Text("${item.titleList}", style: const TextStyle(color: Colors.white),
                                            ),
                                          ),
                                          TextButton(onPressed:(){
                                            Get.to(()=>ListMoviePage(modelList: item) );}
                                              , child: Text("Veja mais"))
                                        ],),
                                      ListMovieComponent( listaFilmes: item.getlistMovie,),
                                    ],
                                  );
                              },

                      )

                    ),)
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
