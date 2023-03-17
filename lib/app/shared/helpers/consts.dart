abstract class Api {
  // my api key
  static const String apiToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjNDdmMDI5MGRhODAyMWRlZDdiMGFkZjIzODlmNTIzOSIsInN1YiI6IjYxZWRkYjQ4YzVhZGE1MDAxYzFmOWM1MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.CZQW__Jx8pSv_Hrv7XB_pOL_-fx4P2W2LMs0GUvDqW8';

  // my api key
  static const String _idFilmDetail = '120';

  /// A People resource is an individual person or character within the Star Wars universe.
  static const baseUrl = 'https://api.themoviedb.org/3/';

  // get all the people resources
  static String pathDetailsMovie = 'movie/$_idFilmDetail';
}
