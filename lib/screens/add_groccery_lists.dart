import 'dart:io';

import 'package:flutter/material.dart';


import 'package:provider/provider.dart';
import 'package:rush_delivery/widgets/app_drawer.dart';
import 'package:rush_delivery/widgets/image_input.dart';


import '../providers/Added_lists.dart';

class AddGrocceryLisrScreen extends StatefulWidget {
  static const routeName = '/add-groccery-list';

  @override
  _AddGrocceryLisrScreenState createState() => _AddGrocceryLisrScreenState();
}

class _AddGrocceryLisrScreenState extends State<AddGrocceryLisrScreen> {
  
   final _titleController = TextEditingController();
  File _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savePlace() {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }
    Provider.of<AddedLists>(context, listen: false)
        .addGrocceryList (_titleController.text, _pickedImage);
    Navigator.of(context).pop();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a New Groccery List'),
      ),
      drawer: AppDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: _titleController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ImageInput(_selectImage),
                  ],
                ),
              ),
            ),
          ),
          RaisedButton.icon(
            icon: Icon(Icons.add),
            label: Text('Add List'),
            onPressed: _savePlace,
            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: Theme.of(context).accentColor,
          ),
        ],
      ),
    );
  }
}
