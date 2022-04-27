import 'package:flutter_application_1/model/movie_response.dart';
import 'package:flutter_application_1/repository/repository.dart';
import 'package:rxdart/subjects.dart';
import 'package:flutter/material.dart';

class SimilarMoviesBloc{
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieResponse> _subject = BehaviorSubject<MovieResponse>();

  getSimilarMovies(int id) async{
    MovieResponse response = await _repository.getSimilarMovies(id);
    _subject.sink.add(response);

  }

  void drainStream(){_subject.value = null;}
  @mustCallSuper
  void dispose() async {
    await _subject.drain();
    _subject.close(); 
  }

  BehaviorSubject<MovieResponse> get subject => _subject;

  
}
final similarMoviesBloc= SimilarMoviesBloc();