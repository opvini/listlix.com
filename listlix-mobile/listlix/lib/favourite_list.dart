import 'package:flutter/material.dart';

import './add_favourite.dart';
import './model.dart';
import './repository.dart';
import './toolbox/ui_toolbox.dart';

class FavouritesListPage extends StatefulWidget {
  @override
  _FavouritesListPageState createState() => _FavouritesListPageState();
}

class _FavouritesListPageState extends State<FavouritesListPage> {
  @override
  Widget build(BuildContext context) {
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
        children: List.generate(FavouritesRepository().count() * 2, (index) {
          if (index.isOdd) {
            return Divider();
          } else {
            return _buildRow(FavouritesRepository().findAll()[index ~/ 2]);
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
      setState(() => FavouritesRepository().save(newFavourite));
    }
  }
}
