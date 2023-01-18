
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:the_movie/components/CardComponent.dart';
import 'package:the_movie/view/MovieDetalhesPage.dart';
import '../config/Config.dart';
import '../controller/ListMoviePageController.dart';
import '../model/ListsModel.dart';
import '../model/Movie.dart';

class ListMoviePage extends StatelessWidget {
    ListModel modelList;
   ListMoviePage({Key? key ,required this.modelList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controllerList = Get.put(ListMoviePageController(modelList ));


    return Scaffold(
      appBar:AppBar(
          title:Text("${modelList.titleList}")
      ),
      body:Container(
        color: Colors.black45,
        padding: EdgeInsets.all(8),

          child: Obx(()=>
              GridView.builder(
                gridDelegate:const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 220,
                  mainAxisExtent: 300,
                  mainAxisSpacing: 20,
                ),
                itemCount: controllerList.listMovie.length,
                itemBuilder: ( _, index) {
                  Movie item =  controllerList.listMovie.elementAt(index);
                  controllerList.pagination(index, controllerList.listMovie.length);

                  return GestureDetector(
                      onTap: (){Get.to(()=>MovieDetalhesPage(movie: item));},
                      child: CardComponent(
                        urlImg: "${Config.BASE_URLIMG}${Config.BASE_URLIMG_SIZE}${item.posterPath}",
                        titulo:"${item.title}",
                      )
                  );
                },

              )
          ),

      ) ,
    );
  }
}
