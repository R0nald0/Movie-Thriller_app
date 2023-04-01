import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:the_movie/model/MovieLatesy.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../model/ItemMovieTrailler.dart';
import '../data/repository/MovieRepository.dart';

class VideoPlayer extends StatefulWidget {
  String? movieTrailler;

  VideoPlayer({Key? key, required this.movieTrailler}) : super(key: key);
  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late YoutubePlayerController playerController;
  String url = "https://www.youtube.com/watch?v=QxJQbWOIK4s";

  @override
  void initState() {
    super.initState();
    print("video player = ${widget.movieTrailler}");
    playerController = YoutubePlayerController(
        flags: YoutubePlayerFlags(autoPlay: false),
        initialVideoId: "${widget.movieTrailler}");
  }

  @override
  void deactivate() {
    playerController.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    playerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      builder: (context, player) {
        return ListView();
      },
      player: youTubePlay(),
    );
  }

  youTubePlay() {
    return YoutubePlayer(controller: playerController);
  }
}
