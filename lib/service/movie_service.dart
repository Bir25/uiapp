


import 'dart:convert';

import 'package:appflut/api.dart';
import 'package:appflut/models/movie.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MovieService{
  static Future<List<Movie>>getMovieByCategory({required String apiPath, required int page}) async{
final dio = Dio();

    final prefs = await SharedPreferences.getInstance();
    try{
final response = await dio.get(apiPath, queryParameters: {
  'api_key':'4d501906a5d3e282368d8715152cd5a8',
  'language':'en-US',
  'page':page
});
if(apiPath == Api.popularMovieUrl){
  final response1 = await dio.get(apiPath, queryParameters: {
    'api_key':'4d501906a5d3e282368d8715152cd5a8',
    'language':'en-US',
    'page':1
  });
  await prefs.setString('movie', jsonEncode(response1.data['results']));
}
final data = (response.data['results'] as List).map((e) => Movie.fromJson(e)).toList();
return data;
}on DioError catch(err)
    {
      if(apiPath == Api.popularMovieUrl){
        final data = prefs.getString('movie');
        return  (jsonDecode(data!) as List).map((e) => Movie.fromJson(e)).toList();
      }else{
        return[];
      }

    }
  }
  static Future<List<Movie>>searchMovie({required String apiPath, required int page, required String query}) async{
    final dio = Dio();
    try{
      final response = await dio.get(apiPath, queryParameters: {
        'api_key':'4d501906a5d3e282368d8715152cd5a8',
        'language':'en-US',
        'query': query,
        'page':page
      });
if((response.data['results'] as List).isEmpty){
  return [Movie(id:0, title: 'no-data', overview: '', poster_path: "", release_date: "", vote_average: "")];
}else{
  final data = (response.data['results'] as List).map((e) => Movie.fromJson(e)).toList();
  return data;
}

    }on DioError catch(err)
    {
      print(err);
      return[];
    }
  }
}