import 'package:flutter/material.dart';
import 'package:movies_app/view/constants/constants.dart';
import 'package:movies_app/data/data.dart';
import 'package:sizer/sizer.dart';

class CastItem extends StatelessWidget {
  const CastItem({
    super.key,
    required this.kind,
    required this.index,
    required this.num,
  });

  final String kind;
  final int index;
  final int num;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 7.h,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [Constants.kPinkColor, Constants.kGreenColor]),
          borderRadius: BorderRadius.circular(10.sp)),
      child: Row(children: [
        CircleAvatar(
            radius: 25.sp,
            backgroundImage: kind == "upcoming"
                ? AssetImage(upcomingMovies[index].movieCastimage[num])
                : AssetImage(newMovies[index].movieCastimage[num])),
        Container(
          alignment: Alignment.center,
          width: 20.w,
          height: 7.h,
          child: kind == "upcoming"
              ? Text(
                  upcomingMovies[index].movieCast[num],
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                )
              : Text(
                  newMovies[index].movieCast[num],
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
        )
      ]),
    );
  }
}
