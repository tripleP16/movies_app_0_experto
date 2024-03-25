import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/domain/entities/actor.dart';
import 'package:movies_app/presentation/providers/actors/actors_repository_provider.dart';

final actorsProvider =
    StateNotifierProvider<ActorsMapNotifier, Map<String, List<Actor>>>((ref) {
  final getActors = ref.watch(actorsRepositoryProvider).getActorsByMovie;
  return ActorsMapNotifier(getActors: getActors);
});

typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);

class ActorsMapNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorsCallback getActors;
  ActorsMapNotifier({required this.getActors}) : super({});

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;

    final actors = await getActors(movieId);

    state = {...state, movieId: actors};
  }
}
