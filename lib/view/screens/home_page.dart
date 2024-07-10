import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/view/constants/constants.dart';
import 'package:movies_app/data/data.dart';
import 'package:movies_app/view/screens/search.dart';
import 'package:movies_app/view/shared_widgets/bottom_appBar.dart';
import 'package:movies_app/view/shared_widgets/popular_movie.dart';
import 'package:movies_app/view/shared_widgets/upcoming_movie.dart';
import 'package:sizer/sizer.dart';

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
      bottomNavigationBar: const BottomBar(),
      backgroundColor: Constants.kBlackColor,
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
                    const PopularMovies(),
                    ////////////////////////////////////////////////////////////////////////////
                    const UpcomingMovies(),
                    //////////////////////////////////////////////////////////////

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
