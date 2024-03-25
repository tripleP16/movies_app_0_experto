import 'package:dio/dio.dart';
import 'package:movies_app/config/constants/environment.dart';
import 'package:movies_app/domain/datasources/actors_datasource.dart';
import 'package:movies_app/domain/entities/actor.dart';
import 'package:movies_app/infraestructure/mappers/actor_mapper.dart';
import 'package:movies_app/infraestructure/models/moviedb/credits_moviedb_response.dart';

class ActorMovieDbDatasource extends ActorsDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.movieDbKey,
        'language': 'es-MX'
      }));

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final result = await dio.get('/movie/$movieId/credits');

    final cast = _jsonToActors(result.data);

    return cast;
  }

  List<Actor> _jsonToActors(Map<String, dynamic> json) {
    final movieDBResponse = CreditsResponse.fromJson(json);
    return movieDBResponse.cast
        .map((e) => ActorMapper.castToEntity(e))
        .toList();
  }
}
