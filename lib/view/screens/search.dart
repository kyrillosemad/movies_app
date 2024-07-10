import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/view/constants/constants.dart';
import 'package:movies_app/models/movie_model.dart';
import 'package:movies_app/view/screens/movie.dart';
import 'package:sizer/sizer.dart';

class MovieSearchDelegate extends SearchDelegate {
  final List<Movie> movies;

  MovieSearchDelegate(this.movies);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<Movie> results = movies
        .where((movie) =>
            movie.movieName.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final Movie movie = results[index];
        return Container(
          width: 100.w,
          margin: EdgeInsets.only(top: 5.sp),
          child: ListTile(
            leading: Image.asset(movie.moviePoster),
            title: Text(movie.movieName),
            onTap: () {},
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<Movie> suggestions = movies
        .where((movie) =>
            movie.movieName.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final Movie movie = suggestions[index];

        return Container(
          height: 8.h,
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [Constants.kPinkColor, Constants.kGreenColor]),
              borderRadius: BorderRadius.circular(10.sp)),
          margin: EdgeInsets.only(top: 7.sp),
          child: Center(
            child: ListTile(
              leading: CircleAvatar(
                radius: 20.sp,
                backgroundImage: AssetImage(movie.moviePoster),
              ),
              title: Text(
                movie.movieName,
                style: TextStyle(fontSize: 15.sp, color: Colors.white),
              ),
              onTap: () {
                if (index == 0 || index == 1 || index == 2) {
                  Get.to(const MOVIE(),
                      arguments: {"index": index, "kind": "popular"});
                } else {
                  Get.to(const MOVIE(),
                      arguments: {"index": index - 3, "kind": "upcoming"});
                }
              },
            ),
          ),
        );
      },
    );
  }
}
