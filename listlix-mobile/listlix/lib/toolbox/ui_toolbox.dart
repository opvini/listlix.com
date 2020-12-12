import 'package:flutter/material.dart';

import '../model.dart';

extension FavouriteTypeIconExt on FavouriteType {
  /// Icon for each favourite type
  static const iconMap = {
    FavouriteType.tv: Icons.tv,
    FavouriteType.film: Icons.local_movies_outlined,
    FavouriteType.book: Icons.menu_book,
    FavouriteType.song: Icons.music_note_outlined,
    FavouriteType.album: Icons.album_sharp,
    FavouriteType.podcast: Icons.headset_outlined,
    FavouriteType.game: Icons.videogame_asset_outlined,
  };

  IconData get icon => iconMap[this];
}
