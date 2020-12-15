import 'package:flutter/material.dart';

import './add_favourite.dart';
import './model.dart';
import './toolbox/ui_toolbox.dart';

class FavouritesListPage extends StatefulWidget {
  @override
  _FavouritesListPageState createState() => _FavouritesListPageState();
}

class _FavouritesListPageState extends State<FavouritesListPage> {
  var _favourites = [
    Favourite(name: 'Mad Men', type: FavouriteType.tv),
    Favourite(name: 'Inglourious Basterds', type: FavouriteType.film),
    Favourite(name: 'Little Wing', type: FavouriteType.song),
    Favourite(name: 'The Dark Side of the Moon', type: FavouriteType.album),
    Favourite(name: 'Past Gas', type: FavouriteType.podcast),
    Favourite(name: 'Resident Evil 3: Nemesis', type: FavouriteType.game),
  ];

  @override
  Widget build(BuildContext context) {
    return _buildFavourites();
  }

  Widget _buildFavourites() {
    return Scaffold(
      appBar: AppBar(
        title: Text('listlix'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            tooltip: 'Add new item',
            onPressed: _pushAddItem,
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: List.generate(_favourites.length * 2, (index) {
          if (index.isOdd) {
            return Divider();
          } else {
            return _buildRow(_favourites[(index ~/ 2)]);
          }
        }),
      ),
    );
  }

  Widget _buildRow(Favourite item) {
    return ListTile(
      leading: Icon(
        item.type.icon,
        color: Colors.deepOrangeAccent,
      ),
      title: Text(
        item.name,
        style: TextStyle(fontSize: 18.0),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 4.0,
      ),
    );
  }

  void _pushAddItem() async {
    // Wait for AddFavouritePage to return a new favourite
    final newFavourite = await Navigator.of(context).push(
      MaterialPageRoute<Favourite>(
        builder: (BuildContext context) => AddFavouritePage(),
      ),
    );
    // Add the new favourite to the list
    if (newFavourite != null) {
      setState(() {
        _favourites.add(newFavourite);
      });
    }
  }
}
