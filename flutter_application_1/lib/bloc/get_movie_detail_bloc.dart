
import 'package:flutter_application_1/model/movie_detail_response.dart';
import 'package:flutter_application_1/repository/repository.dart';
import 'package:rxdart/subjects.dart';
import 'package:flutter/material.dart';

class MovieDetailBloc{
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieDetailResponse> _subject = BehaviorSubject<MovieDetailResponse>();

  getMovieDetail(int id) async{
    MovieDetailResponse response = await _repository.getMovieDetail(id);
    _subject.sink.add(response);

  }

  void drainStream(){_subject.value = null;}
  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close(); 
  }

  BehaviorSubject<MovieDetailResponse> get subject => _subject;
  
  
}
final movieDetailBloc = MovieDetailBloc();
