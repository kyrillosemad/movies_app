import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/data/data.dart';
import 'package:movies_app/view/constants/constants.dart';
import 'package:movies_app/view/shared_widgets/cast.dart';
import 'package:movies_app/view/shared_widgets/movie_details.dart';
import 'package:movies_app/view/shared_widgets/movie_img.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MOVIE extends StatefulWidget {
  const MOVIE({super.key});
  @override
  State<MOVIE> createState() => _MOVIEState();
}
class _MOVIEState extends State<MOVIE> {
  int index = Get.arguments["index"];
  String kind = Get.arguments["kind"];
  late YoutubePlayer player;
  late YoutubePlayerController cont;
  @override
  void initState() {
    super.initState();
    kind == "upcoming"
        ? cont = YoutubePlayerController(
            initialVideoId:
                YoutubePlayer.convertUrlToId(upcomingMovies[index].trailerurl)!)
        : cont = YoutubePlayerController(
            flags: const YoutubePlayerFlags(),
            initialVideoId:
                YoutubePlayer.convertUrlToId(newMovies[index].trailerurl)!);
    player = YoutubePlayer(
      controller: cont,
      showVideoProgressIndicator: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.kBlackColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                MovieImg(index: index, kind: kind, player: player),
                MovieDetails(index: index, kind: kind),
                Cast(index: index, kind: kind),
              ],
            ),
          ),
        ));
  }
}
