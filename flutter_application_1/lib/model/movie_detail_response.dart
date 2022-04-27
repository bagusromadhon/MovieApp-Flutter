// @dart=2.9
import 'package:flutter_application_1/model/movie_detail.dart';

class MovieDetailResponse {
  final MovieDetail movieDetail;
  final String error;

  MovieDetailResponse(this.movieDetail,this.error);

  MovieDetailResponse.fromJson(Map<String,dynamic>json)
  : movieDetail = MovieDetail.fromjson(json),
  error="";

  MovieDetailResponse.withError(String errorValue)
  : movieDetail = MovieDetail(null,null,null,null,"",null),
  error = errorValue;
  

}