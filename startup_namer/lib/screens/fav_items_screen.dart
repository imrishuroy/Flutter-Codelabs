import 'package:flutter/material.dart';
import 'package:startup_namer/data/data.dart';

class FavItemsScreen extends StatefulWidget {
  @override
  _FavItemsScreenState createState() => _FavItemsScreenState();
}

class _FavItemsScreenState extends State<FavItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Your Favourites'),
      ),
      body: ListView.separated(
        separatorBuilder: (context, i) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Divider(
            color: Colors.grey[500],
          ),
        ),
        itemCount: words.length,
        itemBuilder: (context, i) {
          return ListTile(
            contentPadding: EdgeInsets.only(left: 15.0, right: 15.0),
            title: Text('${words.elementAt(i).asPascalCase}'),
          );
        },
      ),
    );
  }
}
