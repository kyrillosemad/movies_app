// ignore_for_file: prefer_typing_uninitialized_variables, unnecessary_import\
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/data/data.dart';
import 'package:movies_app/view/constants/constants.dart';
import 'package:movies_app/view/screens/trailer.dart';
import 'package:sizer/sizer.dart';

class MovieImg extends StatelessWidget {
  final kind;
  final player;
  final index;
  const MovieImg(
      {super.key,
      required this.index,
      required this.kind,
      required this.player});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                            border:
                                Border.all(color: Colors.white, width: 2.sp),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(100)),
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
                            border:
                                Border.all(color: Colors.white, width: 2.sp),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(100)),
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
                Get.to(const Trailer(), arguments: {"player": player});
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
    );
  }
}
