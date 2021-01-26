import 'dart:io';

import 'package:flutter/cupertino.dart';

class PlaceLocation {
  final double latitude;
  final double longitude;
  final String addrees;
  PlaceLocation(
      {@required this.latitude,
      @required this.longitude,
      @required this.addrees});
}

class Place {
  final String id;
  final String title;
  final PlaceLocation location;
  final File image;
  Place(
      {@required this.id,
      @required this.image,
      @required this.location,
      @required this.title});
}
