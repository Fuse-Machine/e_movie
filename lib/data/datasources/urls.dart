class Urls {
  static String imageUrl = "https://image.tmdb.org/t/p/original/";
   static String apiKey = "44dfec5a7590b0d6c1f01106353ff822";
  static String mainUrl = "https://api.themoviedb.org/3";
 

  static String getUpComingApi = '$mainUrl/movie/upcoming';
  static String getPopularMoviesApi = '$mainUrl/movie/popular';
  static String getTopRatedMoviesApi = '$mainUrl/movie/top_rated';
  static String getNowPlayingMoviesApi = '$mainUrl/movie/now_playing';

  static String getMoviesApi = '$mainUrl/movie/top_rated';
  static String getMoviesUrl = '$mainUrl/discover/movie';
  static String getPlayingUrl = '$mainUrl/movie/now_playing';
  static String getGenresUrl = "$mainUrl/genre/movie/list";
  static String getPersonsUrl = "$mainUrl/trending/person/week";
  static String movieUrl = "$mainUrl/movie";
}
