// Copyright 2020 The listlix team. All rights reserved.

import 'package:flutter/material.dart';

import './favourite_list.dart';

void main() => runApp(ListlixApp());

class ListlixApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'listlix',
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Open Sans',
        primaryColor: Colors.deepOrange,
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FavouritesListPage(),
    );
  }
}
