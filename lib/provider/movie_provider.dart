



import 'package:appflut/api.dart';
import 'package:appflut/models/movie.dart';
import 'package:appflut/models/movie_state.dart';
import 'package:appflut/service/movie_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final movieProvider = StateNotifierProvider<MovieProvider, MovieState>((ref) => MovieProvider(MovieState.initState()));
class MovieProvider extends StateNotifier<MovieState> {

  MovieProvider(super.state) {
    getMovieData();
  }

  Future <void> getMovieData() async {
    List<Movie>_movies = [];
    if (state.searchText.isEmpty) {
      _movies = await MovieService.getMovieByCategory(
          apiPath: state.apiPath, page: state.page);

    } else {
      _movies = await MovieService.searchMovie(
          apiPath: state.apiPath, page: state.page, query: state.searchText);
    }
    state = state.copyWith(
      movies: [...state.movies, ..._movies]
    );
  }
  void changeCategory({required String apiPath}){
    state = state.copyWith(
      apiPath: apiPath,
      searchText: '',
      movies:[],
    );
   getMovieData();
}
  void searchMovie({required String searchText }) {
    state = state.copyWith(
      apiPath: Api.searchMovieUrl,
      searchText: searchText,
      movies: [],
    );
    getMovieData();
  }
  void loadMore() {
    state = state.copyWith(
      searchText: '',
      page: state.page + 1
    );
    getMovieData();
  }
}
final videoProvider = FutureProvider.family((ref, int id) => VideoProvider().getVideoId(id));
class VideoProvider{
  Future<String> getVideoId(int videoId) async{
    final dio = Dio();
    final response = await dio.get('https://api.themoviedb.org/3/movie/$videoId/videos', queryParameters: {
      'api_key':'4d501906a5d3e282368d8715152cd5a8',
    });
    return response.data['results'][0]['key'];
  }
}