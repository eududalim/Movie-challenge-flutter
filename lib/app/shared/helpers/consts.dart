abstract class Api {
  // my api key
  static const String _apiKey = 'c47f0290da8021ded7b0adf2389f5239';

  /// A People resource is an individual person or character within the Star Wars universe.
  static const baseUrl = 'https://api.themoviedb.org/3/';

  // get all the people resources
  static String getDetailsMovie(int id) =>
      'movie/${id.toString()}?api_key=$_apiKey';

  // get film data resources
  static const pathFilm = '/films/';

  // get all the people resources
  static const pathSpecie = '/specie/';

  // get a specific people resource
  static const pathOnePeaple = '/people/:id/';
}
