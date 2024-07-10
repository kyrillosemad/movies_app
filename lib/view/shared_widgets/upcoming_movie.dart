import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/data/data.dart';
import 'package:movies_app/view/screens/movie.dart';
import 'package:sizer/sizer.dart';
import 'package:widget_mask/widget_mask.dart';

class UpcomingMovies extends StatelessWidget {
  const UpcomingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 30.h,
      padding: EdgeInsets.all(5.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "UPcoming movies",
            style: TextStyle(fontSize: 17.sp, color: Colors.white),
          ),
          SizedBox(
            height: 2.h,
          ),
          SizedBox(
            width: 99.w,
            height: 20.h,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: upcomingMovies.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Get.to(const MOVIE(),
                        arguments: {"index": index, "kind": "upcoming"});
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 10.sp),
                    width: 45.w,
                    height: 18.h,
                    child: WidgetMask(
                      blendMode: BlendMode.srcATop,
                      childSaveLayer: true,
                      mask: Image.asset(
                        upcomingMovies[index].moviePoster,
                        fit: BoxFit.fill,
                      ),
                      child: Image.asset("assets/mask/mask.png"),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
