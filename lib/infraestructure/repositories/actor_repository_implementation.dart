import 'package:movies_app/domain/datasources/actors_datasource.dart';
import 'package:movies_app/domain/entities/actor.dart';
import 'package:movies_app/domain/repositories/actors_repository.dart';

class ActorRepositoryImplementation extends ActorsRepository {
  final ActorsDatasource _datasource;

  ActorRepositoryImplementation(this._datasource);

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return _datasource.getActorsByMovie(movieId);
  }
}
