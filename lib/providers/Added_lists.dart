import 'dart:io';

import 'package:flutter/foundation.dart';

import '../models/Groccery_list.dart';
import '../helpers/db_helper.dart';

class AddedLists with ChangeNotifier {
  List<GrocceryList> _items = [];

  List<GrocceryList> get items {
    return _items;
  }

  void addGrocceryList(
    String pickedTitle,
    File pickedImage,
  ) {
    final newPlace = GrocceryList(
      id: DateTime.now().toString(),
      image: pickedImage,
      title: pickedTitle,
      // location: null,
    );
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert(' user_lists', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });
  }

  Future<void> fetchAndSetLists() async {
    final dataList = await DBHelper.getData(' user_lists');
    _items = dataList
        .map(
          (item) => GrocceryList(
                id: item['id'],
                title: item['title'],
                image: File(item['image']),
                // location: null,
              ),
        )
        .toList();
    notifyListeners();
  }
}
