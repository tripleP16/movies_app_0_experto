import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/infraestructure/datasources/movie_db_datasource.dart';
import 'package:movies_app/infraestructure/repositories/movie_repository_implementation.dart';

final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImplementation(datasource: MovieDbDatasource());
});
