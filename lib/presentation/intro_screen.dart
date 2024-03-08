import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/modules/constants.dart';
import 'package:movies_app/presentation/home_page.dart';
import 'package:sizer/sizer.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.kBlackColor,
      body: SafeArea(
          child: SizedBox(
        width: 100.w,
        height: 100.h,
        child: Stack(children: [
          Positioned(
            top: 25.h,
            right: -100,
            child: Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Constants.kGreenColor,
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
              ),
            ),
          ),
          ///////////////////////////////////////////////////////////////////////
          ////////////////////////////////////////////////////////////////////////
          ///////////////////////////////////////////////////////////////////////
          /////////////////////////////////////////////////////////////////////////
          ///////////////////////////////////////////////////////////////////////
          ////////////////////////////////////////////////////////////////////////
          Positioned(
            top: 3.h,
            left: -100,
            child: Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Constants.kPinkColor,
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
                child: const SizedBox(
                  height: 300,
                  width: 300,
                ),
              ),
            ),
          ),
          ///////////////////////////////////////////////////////////////////////
          ////////////////////////////////////////////////////////////////////////
          ///////////////////////////////////////////////////////////////////////
          /////////////////////////////////////////////////////////////////////////
          ///////////////////////////////////////////////////////////////////////
          ////////////////////////////////////////////////////////////////////////
          Positioned(
              top: 12.5.h,
              right: 9.5.w,
              child: CircleAvatar(
                radius: 40.w,
                backgroundColor: Constants.kPinkColor,
              )),
          Positioned(
              top: 13.h,
              right: 8.5.w,
              child: CircleAvatar(
                radius: 40.w,
                backgroundColor: Constants.kGreenColor,
              )),
          Positioned(
              top: 12.8.h,
              right: 9.w,
              child: CircleAvatar(
                  radius: 40.w,
                  backgroundImage:
                      const AssetImage("assets/img-onboarding.png"))),
          ///////////////////////////////////////////////////////////////////////
          ////////////////////////////////////////////////////////////////////////
          ///////////////////////////////////////////////////////////////////////
          /////////////////////////////////////////////////////////////////////////
          ///////////////////////////////////////////////////////////////////////
          ////////////////////////////////////////////////////////////////////////
          Positioned(
              top: 50.h,
              child: SizedBox(
                width: 100.w,
                height: 50.h,
                child: Center(
                    child: Column(
                  children: [
                    SizedBox(
                      height: 7.h,
                    ),
                    SizedBox(
                      width: 100.w,
                      height: 15.h,
                      child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Watch movies in",
                                style: TextStyle(
                                    fontSize: 30.sp, color: Colors.white),
                              ),
                              Text("virtual Reality",
                                  style: TextStyle(
                                      fontSize: 30.sp, color: Colors.white))
                            ]),
                      ),
                    ),
                    SizedBox(
                      width: 100.w,
                      height: 10.h,
                      child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                " Download and watch offline",
                                style: TextStyle(
                                    fontSize: 13.sp, color: Colors.white),
                              ),
                              Text("wherever you are",
                                  style: TextStyle(
                                      fontSize: 13.sp, color: Colors.white))
                            ]),
                      ),
                    ),
                    SizedBox(
                      width: 100.w,
                      height: 15.h,
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            Get.offAll(const HomePage());
                          },
                          child: Container(
                              width: 45.w,
                              height: 7.h,
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(colors: [
                                    Constants.kPinkColor,
                                    Constants.kGreenColor,
                                  ]),
                                  borderRadius: BorderRadius.circular(20.sp)),
                              child: Center(
                                  child: Text(
                                "Get started",
                                style: TextStyle(
                                    fontSize: 15.sp, color: Colors.white),
                              ))),
                        ),
                      ),
                    )
                  ],
                )),
              )),
        ]),
      )),
    );
  }
}
