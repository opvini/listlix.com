import 'package:flutter/material.dart';

import './model.dart';

class AddFavouritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Add favourite'),
        ),
      ),
      body: AddFavouriteForm(),
    );
  }
}

// Define a custom Form widget.
class AddFavouriteForm extends StatefulWidget {
  @override
  AddFavouriteFormState createState() {
    return AddFavouriteFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class AddFavouriteFormState extends State<AddFavouriteForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final nameTextEditingCtrl = TextEditingController();

  FavouriteType _character = FavouriteType.tv;

  @override
  Widget build(BuildContext context) {
    // Favourite types radio buttons
    final typesListTiles = FavouriteType.values.map(
      (type) => ListTile(
        leading: Radio(
          value: type,
          groupValue: _character,
          onChanged: (FavouriteType value) {
            setState(() {
              _character = value;
            });
          },
          activeColor: Colors.blueAccent,
        ),
        title: Text(type.description),
      ),
    );

    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: nameTextEditingCtrl,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                        width: 4.0,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blueAccent,
                        width: 2.0,
                      ),
                    ),
                    hintText: "TV series, film, book, song...",
                  ),
                ),
              ),
              ...typesListTiles,
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, return data to previous page
                  Navigator.pop(
                    context,
                    Favourite(
                      name: nameTextEditingCtrl.text,
                      type: _character,
                    ),
                  );
                }
              },
              child: Text('Confirm'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameTextEditingCtrl.dispose();
    super.dispose();
  }
}
