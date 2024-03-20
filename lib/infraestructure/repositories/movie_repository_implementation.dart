import 'package:movies_app/domain/datasources/movies_datasource.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/domain/repositories/movies_repository.dart';

class MovieRepositoryImplementation extends MoviesRepository {
  final MoviesDatasource datasource;

  MovieRepositoryImplementation({required this.datasource});

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }

  @override
  Future<List<Movie>> getPopularMovies({int page = 1}) {
    return datasource.getPopularMovies(page: page);
  }
}
