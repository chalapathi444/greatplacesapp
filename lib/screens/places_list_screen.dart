import "package:flutter/material.dart";
import 'package:greatplacesapp/providers/great_places.dart';
import 'package:greatplacesapp/screens/add_place_scrrend.dart';
import 'package:provider/provider.dart';

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
        body: FutureBuilder(
          future: Provider.of<GreatPlaces>(context, listen: false)
              .fetchAndSetPlaces(),
          builder: (ctx, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Consumer<GreatPlaces>(
                      child: Center(
                          child: Text('Got no places yt,start adding some!')),
                      builder: (ctx, greatPlaces, ch) =>
                          greatPlaces.items.length <= 0
                              ? ch
                              : ListView.builder(
                                  itemBuilder: (ctx, i) => ListTile(
                                    onTap: () {},
                                    title: Text(greatPlaces.items[i].title),
                                    leading: CircleAvatar(
                                      backgroundImage: FileImage(
                                        greatPlaces.items[i].image,
                                      ),
                                    ),
                                  ),
                                  itemCount: greatPlaces.items.length,
                                ),
                    ),
        ));
  }
}
