enum FavouriteType {
  tv,
  film,
  book,
  song,
  album,
  podcast,
  game,
}

extension FavouriteTypeDescriptionExt on FavouriteType {
  /// Description for each favourite type
  static const descriptionMap = {
    FavouriteType.tv: 'TV Series',
    FavouriteType.film: 'Film',
    FavouriteType.book: 'Book',
    FavouriteType.song: 'Song',
    FavouriteType.album: 'Album',
    FavouriteType.podcast: 'Podcast',
    FavouriteType.game: 'Game',
  };

  String get description => descriptionMap[this];
}

class Favourite {
  String name;
  FavouriteType type;

  Favourite({this.name, this.type});
}
