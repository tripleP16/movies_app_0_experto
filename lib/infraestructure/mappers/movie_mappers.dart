import 'package:movies_app/domain/entities/movie.dart';
import 'package:movies_app/infraestructure/models/movie_moviedb.dart';
import 'package:movies_app/infraestructure/models/moviedb_details_response.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieFromMovieDb movie) => Movie(
      adult: movie.adult,
      backdropPath: convertToImage(movie.backdropPath),
      genreIds: movie.genreIds.map((e) => e.toString()).toList(),
      id: movie.id,
      originalLanguage: movie.originalLanguage,
      originalTitle: movie.originalTitle,
      overview: movie.overview,
      popularity: movie.popularity,
      posterPath: convertToImage(movie.posterPath, shouldPutNoImage: false),
      releaseDate: movie.releaseDate,
      title: movie.title,
      video: movie.video,
      voteAverage: movie.voteAverage,
      voteCount: movie.voteCount);

  static String convertToImage(String possibleImage,
      {bool shouldPutNoImage = true}) {
    return possibleImage != ''
        ? 'https://image.tmdb.org/t/p/w500$possibleImage'
        : shouldPutNoImage
            ? 'https://easimages.basnop.com/default-image_600.png'
            : 'no-poster';
  }

  static Movie movieDetailsToEntity(MovieDbDetailsResponse movie) => Movie(
      adult: movie.adult,
      backdropPath: convertToImage(movie.backdropPath ?? ''),
      genreIds: movie.genres.map((e) => e.name).toList(),
      id: movie.id,
      originalLanguage: movie.originalLanguage,
      originalTitle: movie.originalTitle,
      overview: movie.overview,
      popularity: movie.popularity,
      posterPath: convertToImage(movie.posterPath, shouldPutNoImage: false),
      releaseDate: movie.releaseDate,
      title: movie.title,
      video: movie.video,
      voteAverage: movie.voteAverage,
      voteCount: movie.voteCount);
}
