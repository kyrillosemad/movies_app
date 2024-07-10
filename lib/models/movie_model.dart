class Movie {
  Movie({
    this.movieName = '',
    this.moviePoster = '',
    this.movieReleaseYear = '',
    this.movieCategory = '',
    this.movieDuration = '',
    this.movieRating = '',
    this.movieSinopsis = '',
    this.trailerurl = '',
    this.movieCast = const [],
    this.movieCastimage = const [],
  });

  String movieName;
  String moviePoster;
  String movieReleaseYear;
  String movieCategory;
  String movieDuration;
  String movieRating;
  String movieSinopsis;
  String trailerurl;
  List<String> movieCast;
  List<String> movieCastimage;
}


