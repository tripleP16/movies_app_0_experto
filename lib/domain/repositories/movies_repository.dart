import 'package:movies_app/domain/entities/movie.dart';

abstract class MoviesRepository {
  Future<List<Movie>> getNowPlaying({int page = 1});

  Future<List<Movie>> getPopularMovies({int page = 1});
}
