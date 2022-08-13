



class Movie{
  final int id;
  final String title;
  final String overview;
  final String poster_vew;
  final String release_date;
  final String vote_average;

  Movie({
required this.id,
    required this.title,
    required this.overview,
    required this.poster_vew,
    required this.release_date,
    required this.vote_average
});
 factory Movie.fromJson(Map<String, dynamic>json)
 {
   return Movie(id: json['id'], title: json['title'], overview: json['overview'], poster_vew: json['poster_vew'], release_date: json['release_date'], vote_average: '${json['vote_average']}');
 }
}