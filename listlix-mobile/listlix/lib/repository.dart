import './model.dart';

class FavouritesRepository {
  static FavouritesRepository _instance;

  FavouritesRepository._internal() {
    _instance = this;
  }

  factory FavouritesRepository() =>
      _instance ?? FavouritesRepository._internal();

  var _favourites = [
    Favourite(name: 'Mad Men', type: FavouriteType.tv),
    Favourite(name: 'Inglourious Basterds', type: FavouriteType.film),
    Favourite(name: 'Little Wing', type: FavouriteType.song),
    Favourite(name: 'The Dark Side of the Moon', type: FavouriteType.album),
    Favourite(name: 'Past Gas', type: FavouriteType.podcast),
    Favourite(name: 'Resident Evil 3: Nemesis', type: FavouriteType.game),
  ];

  Favourite save(Favourite favourite) {
    this._favourites.add(favourite);
    return favourite;
  }

  List<Favourite> findAll() {
    return this._favourites;
  }

  int count() {
    return this._favourites.length;
  }

  void delete(String name) {
    this._favourites.removeWhere((element) => element.name == name);
  }
}
