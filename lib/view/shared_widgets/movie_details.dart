// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movies_app/data/data.dart';
import 'package:sizer/sizer.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class MovieDetails extends StatelessWidget {
  final kind;
  final index;
  const MovieDetails({super.key,required this.index,required this.kind});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    style: TextStyle(fontSize: 14.sp, color: Colors.white),
                  )
                : Text(
                    "${upcomingMovies[index].movieReleaseYear}.${upcomingMovies[index].movieCategory}",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14.sp, color: Colors.white)),
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
                    style: TextStyle(fontSize: 14.sp, color: Colors.white),
                  ).animate().fade(
                    delay: const Duration(milliseconds: 800),
                    duration: const Duration(seconds: 2))
                : Text(upcomingMovies[index].movieSinopsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14.sp, color: Colors.white))
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
    );
  }
}
