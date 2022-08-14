


import 'package:appflut/models/movie.dart';
import 'package:dio/dio.dart';

class MovieService{
  static Future<List<Movie>>getMovieByCategory({required String apiPath, required int page}) async{
final dio = Dio();
    try{
final response = await dio.get(apiPath, queryParameters: {
  'api_key':'4d501906a5d3e282368d8715152cd5a8',
  'language':'en-US',
  'page':1
});
final data = (response.data['result'] as List).map((e) => Movie.fromJson(e)).toList();
return data;
}on DioError catch(err)
    {
print(err);
return[];
    }
  }
  static Future<List<Movie>>getsearchMovie({required String apiPath, required int page, required String query}) async{
    final dio = Dio();
    try{
      final response = await dio.get(apiPath, queryParameters: {
        'api_key':'4d501906a5d3e282368d8715152cd5a8',
        'language':'en-US',
        'query': query,
        'page':1
      });
      final data = (response.data['result'] as List).map((e) => Movie.fromJson(e)).toList();
      return data;
    }on DioError catch(err)
    {
      print(err);
      return[];
    }
  }
}