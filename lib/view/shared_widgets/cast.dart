// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:movies_app/view/shared_widgets/cast_item.dart';
import 'package:sizer/sizer.dart';

class Cast extends StatelessWidget {
  final kind;
  final index;
  const Cast({super.key, required this.index, required this.kind});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Casts",
            style: TextStyle(color: Colors.white, fontSize: 20.sp),
          ).animate().fade(delay: const Duration(milliseconds: 1500)).slideX(),
          Container(
            padding: EdgeInsets.all(10.sp),
            width: 90.w,
            height: 25.h,
            child: Column(
              children: [
                CastItem(kind: kind, index: index, num: 0),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CastItem(kind: kind, index: index, num: 1),
                    CastItem(kind: kind, index: index, num: 2),
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
