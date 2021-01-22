import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:rush_delivery/providers/Added_lists.dart';
import 'package:rush_delivery/widgets/app_drawer.dart';

import 'add_groccery_lists.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Groccery List'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddGrocceryLisrScreen.routeName);
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future: Provider.of<AddedLists>(context, listen: false)
            .fetchAndSetLists(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<AddedLists>(
                child: Center(
                  child: const Text('Got no Lists yet, start adding some!'),
                ),
                builder: (ctx, addedLists, ch) => addedLists.items.length <= 0
                    ? ch
                    : ListView.builder(
                        itemCount: addedLists.items.length,
                        itemBuilder: (ctx, i) => ListTile(
                              leading: CircleAvatar(
                                backgroundImage: FileImage(
                                  addedLists.items[i].image,
                                ),
                              ),
                              title: Text(addedLists.items[i].title),
                              onTap: () {
                                // Go to detail page ...
                              },
                            ),
                      ),
              ),
      ),
    );
  }
}
