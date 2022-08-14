



import 'package:appflut/models/movie_state.dart';
import 'package:appflut/service/movie_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final movieProvider = StateNotifierProvider<MovieProvider, MovieState>((ref) => MovieProvider(MovieState.initState()));
class MovieProvider extends StateNotifier<MovieState> {

  MovieProvider(super.state) {
    getMovieData();
  }

  Future <void> getMovieData() async {
    final response = await MovieService.getMovieByCategory(
        apiPath: state.apiPath, page: state.page);
    state = state.copyWith(
      movies: response
    );
  }
}
