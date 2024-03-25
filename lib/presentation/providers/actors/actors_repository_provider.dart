import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/domain/repositories/actors_repository.dart';
import 'package:movies_app/infraestructure/datasources/actor_moviedb_datasource.dart';
import 'package:movies_app/infraestructure/repositories/actor_repository_implementation.dart';

final actorsRepositoryProvider = Provider<ActorsRepository>(
    (ref) => ActorRepositoryImplementation(ActorMovieDbDatasource()));
