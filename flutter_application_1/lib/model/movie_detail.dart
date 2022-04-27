import 'package:flutter_application_1/model/genre.dart';

class MovieDetail{
  final int id;
  final bool adult;
  final int budget;
  final List<Genre> genres;
  final String releaseDate;
  final int runtime;

  MovieDetail(
    this.id,
    this.adult,
    this.budget,
    this.genres,
    this.releaseDate,
    this.runtime,
  );

  MovieDetail.fromjson(Map<String, dynamic>json)
  : id = json[""],
    adult = json["adult"],
    budget = json["budget"],
    genres =(json["genres"] as List).map((i) => new Genre.fromJson(i)).toList(),
    releaseDate = json["release_date"],
    runtime = json["runtime"];

  
}