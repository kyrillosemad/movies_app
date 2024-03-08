import 'dart:ui';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/modules/constants.dart';
import 'package:movies_app/modules/movie_model.dart';
import 'package:movies_app/presentation/movie.dart';
import 'package:movies_app/presentation/search.dart';
import 'package:sizer/sizer.dart';
import 'package:widget_mask/widget_mask.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Movie> allMovies = [...newMovies, ...upcomingMovies];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.kBlackColor,
      bottomNavigationBar: CurvedNavigationBar(
        height: 6.5.h,
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        color: const Color.fromARGB(255, 131, 186, 187),
        items: const <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.favorite,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.download,
            size: 30,
            color: Colors.white,
          ),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
      ////////////////////////////////////////////////////////////////
      /////////////////////////////////////////////////////////////////
      ////////////////////////////////////////////////////////////////
      ////////////////////////////////////////////////////////////////
      ////////////////////////////////////////////////////////////////
      ////////////////////body////////////////////////////////////////
      body: SafeArea(
          child: SingleChildScrollView(
        child: SizedBox(
          width: 100.w,
          height: 90.h,
          child: Stack(
            children: [
              SizedBox(
                width: 100.w,
                height: 100.h,
                child: Center(
                    child: Column(
                  children: [
                    SizedBox(
                      width: 100.w,
                      height: 30.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "what would you",
                            style:
                                TextStyle(fontSize: 25.sp, color: Colors.white),
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Text("like to watch ?",
                              style: TextStyle(
                                  fontSize: 25.sp, color: Colors.white)),
                          SizedBox(
                            height: 3.h,
                          ),
                          SizedBox(
                            width: 95.w,
                            height: 6.h,
                            child: TextFormField(
                              decoration: InputDecoration(
                                prefixIconColor: Colors.black,
                                suffixIconColor: Colors.black,
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.black),
                                    borderRadius: BorderRadius.circular(20.sp)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.sp),
                                ),
                                filled: true,
                                fillColor: Colors.grey,
                                prefixIcon: Icon(
                                  Icons.mic,
                                  size: 20.sp,
                                ),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    showSearch(
                                      context: context,
                                      delegate: MovieSearchDelegate(allMovies),
                                    );
                                  },
                                  child: Icon(
                                    Icons.search,
                                    size: 25.sp,
                                  ),
                                ),
                                label: Text(
                                  "search",
                                  style: TextStyle(
                                      fontSize: 15.sp, color: Colors.black),
                                ),
                              ),
                              style: TextStyle(fontSize: 13.sp),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ////////////////////////////////////////////////////////////////////////////
                    ///////////////////////////////////////////////////////////////////////////
                    ////////////////////////////////////////////////////////////////////////////
                    ////////////////////////////////////////////////////////////////////////////
                    ////////////////////////////////////////////////////////////////////////////
                    ////////////////////////////////////////////////////////////////////////////
                    //////////////////////////////////////////////////////////////////////////////
                    Container(
                      width: 100.w,
                      height: 30.h,
                      padding: EdgeInsets.all(5.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Popular movies",
                            style:
                                TextStyle(fontSize: 17.sp, color: Colors.white),
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
                              itemCount: newMovies.length,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: () {
                                    Get.to(const MOVIE(), arguments: {
                                      "index": index,
                                      "kind": "popular"
                                    });
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(left: 10.sp),
                                    width: 45.w,
                                    height: 18.h,
                                    child: WidgetMask(
                                      blendMode: BlendMode.srcATop,
                                      childSaveLayer: true,
                                      mask: Image.asset(
                                        newMovies[index].moviePoster,
                                        fit: BoxFit.fill,
                                      ),
                                      child:
                                          Image.asset("assets/mask/mask.png"),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    //////////////////////////////////////////////////////////////
                    /////////////////////////////////////////////////////////////
                    //////////////////////////////////////////////////////////
                    ///////////////////////////////////////////////////////////
                    ////////////////////////////////////////////////////////////////
                    /////////////////////////////////////////////////////////////
                    ///
                    Container(
                      width: 100.w,
                      height: 30.h,
                      padding: EdgeInsets.all(5.sp),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "UPcoming movies",
                            style:
                                TextStyle(fontSize: 17.sp, color: Colors.white),
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
                                    Get.to(const MOVIE(), arguments: {
                                      "index": index,
                                      "kind": "upcoming"
                                    });
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
                                      child:
                                          Image.asset("assets/mask/mask.png"),
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    //////////////////////////////////////////////////////////////
                    /////////////////////////////////////////////////////////////
                    //////////////////////////////////////////////////////////
                    ///////////////////////////////////////////////////////////
                    ////////////////////////////////////////////////////////////////
                    /////////////////////////////////////////////////////////////
                    ///
                  ],
                )),
              )
            ],
          ),
        ),
      )),
    );
  }
}
