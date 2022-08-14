




import 'package:appflut/api.dart';
import 'package:appflut/models/movie.dart';

class MovieState{
  final String searchText;
  final String apiPath;
  final int page;
  final List<Movie> movies;



  MovieState({
    required this.apiPath,
    required this.searchText,
    required this.movies,
    required this.page
});
  MovieState.initState(): searchText = '', movies = [], page = 1, apiPath = Api.popularMoviesUrl;
MovieState copyWith({
  String? apiPath,
  String? searchText,
 List<Movie>? movies,
  int? page
})
{
  return MovieState(
    apiPath: apiPath ?? this.apiPath,
    page: page ?? this.page,
    movies: movies ?? this.movies,
    searchText: searchText ?? this.searchText
  );
}
}