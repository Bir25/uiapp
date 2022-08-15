



import 'package:appflut/api.dart';
import 'package:appflut/models/movie_state.dart';
import 'package:appflut/service/movie_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final movieProvider = StateNotifierProvider<MovieProvider, MovieState>((ref) => MovieProvider(MovieState.initState()));
class MovieProvider extends StateNotifier<MovieState> {

  MovieProvider(super.state) {
    getMovieData();
  }

  Future <void> getMovieData() async {
    if (state.searchText.isEmpty) {
      final response = await MovieService.getMovieByCategory(
          apiPath: state.apiPath, page: state.page);
      state = state.copyWith(
          movies: response
      );
    } else {
      final response = await MovieService.searchMovie(
          apiPath: state.apiPath, page: state.page, query: state.searchText);
      state = state.copyWith(
          movies: response
      );
    }
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
}