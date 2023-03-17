abstract class Api {
  // my api key
  static const String apiToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjNDdmMDI5MGRhODAyMWRlZDdiMGFkZjIzODlmNTIzOSIsInN1YiI6IjYxZWRkYjQ4YzVhZGE1MDAxYzFmOWM1MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.CZQW__Jx8pSv_Hrv7XB_pOL_-fx4P2W2LMs0GUvDqW8';

  // my api key
  static const String _idFilmDetail = '120';

  static const baseUrl = 'https://api.themoviedb.org/3';

  // Get the movie details
  static String pathDetailsMovie = '/movie/$_idFilmDetail';

  // get all the people resources
  static String pathSearchMovie(String query) =>
      '/search/movie?api_key=c47f0290da8021ded7b0adf2389f5239&query=$query&page=1&include_adult=false';
}
