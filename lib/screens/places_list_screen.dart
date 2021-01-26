import "package:flutter/material.dart";
import 'package:greatplacesapp/screens/add_place_scrrend.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your places"),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.pushNamed(context, AddPlaceScreen.routeName);
              }),
        ],
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
