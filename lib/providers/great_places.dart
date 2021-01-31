import 'package:flutter/foundation.dart';
import 'package:greatplacesapp/helper/db_heleper.dart';
import 'package:greatplacesapp/models/place.dart';
import 'dart:io';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];
  List<Place> get items {
    return [..._items];
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHeleper.getData('user_places');
    _items = dataList
        .map((item) => Place(
            id: item['id'],
            title: item['title'],
            image: File(item['image']),
            location: null))
        .toList();
    notifyListeners();
  }

  void addPlace(String title, File image) async {
    print("entering addplace");
    final newPlace = Place(
      id: DateTime.now().toString(),
      image: image,
      title: title,
      location: null,
    );
    _items.add(newPlace);
    notifyListeners();
    await DBHeleper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path
    });
  }
}
