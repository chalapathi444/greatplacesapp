import 'dart:io';

import 'package:flutter/cupertino.dart';

class Place {
  final String id;
  final String title;
  final location;
  final File image;
  Place(
      {@required this.id,
      @required this.image,
      @required this.location,
      @required this.title});
}
