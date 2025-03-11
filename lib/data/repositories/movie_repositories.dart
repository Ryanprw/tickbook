import 'package:tickbook/domain/entities/actor.dart';
import 'package:tickbook/domain/entities/movie.dart';
import 'package:tickbook/domain/entities/movie_detail.dart';
import 'package:tickbook/domain/entities/result.dart';

abstract class MovieRepositories {
  Future<Result<List<Movie>>> getNowPlaying({int page = 1});
  Future<Result<List<Movie>>> getUpcoming({int page = 1});
  Future<Result<MovieDetail>> getDetail({required int id});
  Future<Result<List<Actor>>> getActors({required int id});
}
