import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:movies_app/modules/constants.dart';
import 'package:movies_app/modules/movie_model.dart';
import 'package:movies_app/presentation/components/cast.dart';
import 'package:movies_app/presentation/trailer.dart';
import 'package:sizer/sizer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

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
            flags: YoutubePlayerFlags(),
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
                Container(
                  width: 100.w,
                  height: 55.h,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: kind == "upcoming"
                              ? AssetImage(
                                  upcomingMovies[index].moviePoster,
                                )
                              : AssetImage(newMovies[index].moviePoster),
                          fit: BoxFit.fill)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        SizedBox(
                          width: 95.w,
                          height: 7.h,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Container(
                                    width: 15.w,
                                    height: 6.h,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.white, width: 2.sp),
                                        color: Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Center(
                                      child: Icon(
                                        Icons.arrow_back,
                                        size: 30.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    width: 15.w,
                                    height: 6.h,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.white, width: 2.sp),
                                        color: Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Center(
                                      child: Icon(
                                        Icons.list,
                                        size: 30.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                        ),
                        SizedBox(
                          height: 33.h,
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(Trailer(),arguments: {"player":player});
                            /*   Get.defaultDialog(
                              backgroundColor: Constants.kGreyColor,
                              title: "movie trailer",
                              titleStyle: TextStyle(
                                  color: Colors.white, fontSize: 20.sp),
                              content: SizedBox(
                                width: 80.w,
                                height: 40.h,
                                child: player,
                              ),
                            );*/
                          },
                          child: Container(
                            padding: EdgeInsets.only(right: 7.sp),
                            width: 99.w,
                            height: 10.h,
                            alignment: Alignment.centerRight,
                            child: Container(
                              width: 20.w,
                              height: 8.h,
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Constants.kPinkColor,
                                    Constants.kGreenColor
                                  ]),
                                  shape: BoxShape.circle),
                              child: Center(
                                  child: Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                                size: 40.sp,
                              )),
                            ),
                          ),
                        ),
                      ]),
                ),
                Container(
                  padding: EdgeInsets.all(5.sp),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        kind == "upcoming"
                            ? AnimatedTextKit(
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                    upcomingMovies[index].movieName,
                                    textStyle: const TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                    speed: const Duration(milliseconds: 200),
                                  ),
                                ],
                                totalRepeatCount: 1,
                                pause: const Duration(milliseconds: 1000),
                                displayFullTextOnTap: true,
                                stopPauseOnTap: true,
                              )
                            : AnimatedTextKit(
                                animatedTexts: [
                                  TypewriterAnimatedText(
                                    newMovies[index].movieName,
                                    textStyle: const TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                    speed: const Duration(milliseconds: 150),
                                  ),
                                ],
                                totalRepeatCount: 1,
                                pause: const Duration(milliseconds: 1000),
                                displayFullTextOnTap: true,
                                stopPauseOnTap: true,
                              ),
                        SizedBox(
                          height: 1.h,
                        ),
                        kind == "upcoming"
                            ? Text(
                                "${upcomingMovies[index].movieReleaseYear}.${upcomingMovies[index].movieCategory}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14.sp, color: Colors.white),
                              )
                            : Text(
                                "${upcomingMovies[index].movieReleaseYear}.${upcomingMovies[index].movieCategory}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14.sp, color: Colors.white)),
                        SizedBox(
                          height: 2.h,
                        ),
                        RatingBar.builder(
                            itemSize: 25.sp,
                            unratedColor: Colors.white,
                            itemBuilder: (context, index) {
                              return const Icon(
                                Icons.star,
                                color: Colors.yellow,
                              );
                            },
                            onRatingUpdate: (val) {}),
                        SizedBox(
                          height: 2.h,
                        ),
                        kind == "upcoming"
                            ? Text(
                                upcomingMovies[index].movieSinopsis,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14.sp, color: Colors.white),
                              ).animate().fade(
                                delay: const Duration(milliseconds: 800),
                                duration: const Duration(seconds: 2))
                            : Text(upcomingMovies[index].movieSinopsis,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 14.sp, color: Colors.white))
                                .animate()
                                .fade(
                                    delay: const Duration(milliseconds: 800),
                                    duration: const Duration(seconds: 2)),
                        SizedBox(
                          height: 2.h,
                        ),
                        SizedBox(
                          width: 80.w,
                          child: Divider(
                            color: Colors.white,
                            thickness: 1.sp,
                          ),
                        ),
                      ]),
                ),
                //////////////////////////////////////////////////////////////////////////
                //////////////////////////////////////////////////////////////////////////
                //////////////////////////////////////////////////////////////////////////
                ///////////////////////////////////////////////////////////////////////
                ///
                Container(
                  padding: EdgeInsets.only(left: 15.sp),
                  width: 100.w,
                  height: 25.h,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Casts",
                          style:
                              TextStyle(color: Colors.white, fontSize: 20.sp),
                        )
                            .animate()
                            .fade(delay: const Duration(milliseconds: 1500))
                            .slideX(),
                        Container(
                          padding: EdgeInsets.all(10.sp),
                          width: 90.w,
                          height: 20.h,
                          child: Column(
                            children: [
                              Cast(kind: kind, index: index, num: 0),
                              SizedBox(
                                height: 2.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Cast(kind: kind, index: index, num: 1),
                                  Cast(kind: kind, index: index, num: 2),
                                ],
                              )
                            ],
                          ),
                        )
                      ]),
                )
              ],
            ),
          ),
        ));
  }
}
