class AppApiConfig {
  AppApiConfig._();

  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "0777b9d4cbff88c11eec77257a7b0226";

  // eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwNzc3YjlkNGNiZmY4OGMxMWVlYzc3MjU3YTdiMDIyNiIsIm5iZiI6MTc1Njg4ODgzMy45NTIsInN1YiI6IjY4YjdmZjAxYTA0YzIyZmI5Nzk0NWUzMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.733QQVezjAOZ1iWWwNAW1P1XDSAPKtYSiz7usrNf-4M

  // movies endpoints
  static const String popularMovies = "/movie/popular";
  static const String nowPlayingMovies = "/movie/now_playing";
  static const String searchMovies = "/search/movie";

  // tv shows endpoints
  static const String nowPlayingTvShows = "/tv/airing_today";
  static const String popularTvShows = "/tv/popular";

  // media
  static const String imagePrefixUrl = "https://image.tmdb.org/t/p/w500";
}
