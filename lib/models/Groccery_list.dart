import 'dart:io';

import 'package:flutter/foundation.dart';

class GrocceryList {
  final String id;
  final String title;
  // final PlaceLocation location;
  final File image;

  GrocceryList({
    @required this.id,
    @required this.title,
    // @required this.location,
    @required this.image,
  });
}
