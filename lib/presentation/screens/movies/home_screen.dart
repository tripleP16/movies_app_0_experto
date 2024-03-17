import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/presentation/providers/providers.dart';
import 'package:movies_app/presentation/widgets/movies/movies_widgets.dart';
import 'package:movies_app/presentation/widgets/shared/shared_widgets.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  ConsumerState<_HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    if (slideShowMovies.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Column(
      children: [
        const CustomAppBar(),
        MoviesSlideshow(movies: slideShowMovies),
        MovieHorizontalListView(
          title: 'En cines',
          movies: nowPlayingMovies,
          subtitle: 'Lunes 20',
        )
      ],
    );
  }
}
