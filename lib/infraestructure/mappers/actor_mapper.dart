import 'package:movies_app/domain/entities/actor.dart';
import 'package:movies_app/infraestructure/models/moviedb/credits_moviedb_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
      id: cast.id,
      name: cast.name,
      profilePath: convertToImage(cast.profilePath ?? ''),
      character: cast.character);

  static String convertToImage(String possibleImage,
      {bool shouldPutNoImage = true}) {
    return possibleImage != ''
        ? 'https://image.tmdb.org/t/p/w500$possibleImage'
        : shouldPutNoImage
            ? 'https://static.vecteezy.com/system/resources/thumbnails/020/765/399/small/default-profile-account-unknown-icon-black-silhouette-free-vector.jpg'
            : 'no-poster';
  }
}
