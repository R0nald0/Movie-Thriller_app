import 'package:get/get.dart';
import 'package:the_movie/model/ListsModel.dart';
import 'package:the_movie/repository/MovieRepository.dart';
import '../model/Movie.dart';

class ListMoviePageController extends GetxController{
        MovieRpository _movieRpository = MovieRpository();
        var  listMovie = <Movie>[].obs;
        late  ListModel modelList ;

        ListMoviePageController(ListModel listModel){
               listMovie.addAll(listModel.getlistMovie) ;
               modelList = listModel;
        }

        pagination(int index , int listLength) async {
          if(index + 1 == listLength) {
              listMovie.addAll( await _movieRpository.recuperarListModel(modelList));
          }
    }

    @override
  void onClose() {
          listMovie.clear();
          modelList.pageList=1;
    print("Metodo de Close");
    super.onClose();
  }
}