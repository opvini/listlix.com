import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
            onPressed: _pushAddFavouritePage,
          ),
        ],
      ),
      body: ListView(
        children: List.generate(FavouritesRepository().count() * 2, (index) {
          if (index.isOdd) {
            return Padding(
              padding: EdgeInsets.only(left: 64.0),
              child: Divider(height: 0.5),
            );
          } else {
            final favourite = FavouritesRepository().findAll()[index ~/ 2];
            return Slidable(
              actionPane: SlidableDrawerActionPane(),
              actionExtentRatio: 0.25,
              child: _buildRow(favourite),
              secondaryActions: <Widget>[
                IconSlideAction(
                  caption: 'Delete',
                  color: Colors.red,
                  icon: Icons.delete,
                  onTap: () => setState(() {
                    FavouritesRepository().delete(favourite.name);
                  }),
                ),
              ],
            );
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

  void _pushAddFavouritePage() async {
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
