import 'package:dio/dio.dart';
import 'package:movies_app/config/constants/environment.dart';
import 'package:movies_app/domain/datasources/movies_datasource.dart';
import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/infraestructure/mappers/movie_mappers.dart';
import 'package:movies_app/infraestructure/models/moviedb_response.dart';

class MovieDbDatasource extends MoviesDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.movieDbKey,
        'language': 'es-MX'
      }));
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response =
        await dio.get('/movie/now_playing', queryParameters: {'page': page});
    final movieDBResponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movies = movieDBResponse.results
        .map((e) => MovieMapper.movieDBToEntity(e))
        .where((e) => e.posterPath != 'no-poster')
        .toList();
    return movies;
  }
}
