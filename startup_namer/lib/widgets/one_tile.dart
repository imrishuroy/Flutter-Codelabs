import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:startup_namer/data/data.dart';

final _biggerFont = const TextStyle(fontSize: 18);

class OneTile extends StatefulWidget {
  final WordPair? pair;

  const OneTile({Key? key, this.pair}) : super(key: key);

  @override
  _OneTileState createState() => _OneTileState();
}

class _OneTileState extends State<OneTile> {
  bool _isFav = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.pair!.asPascalCase,
        style: _biggerFont,
      ),
      trailing: IconButton(
        icon: Icon(
          _isFav ? Icons.favorite : Icons.favorite_border,
          color: _isFav ? Colors.red : Colors.grey[800],
        ),
        onPressed: () {
          setState(() {
            _isFav = !_isFav;
          });
          if (_isFav) {
            words.add(widget.pair!);
          } else {
            if (words.contains(widget.pair!.asPascalCase)) {
              words.remove(widget.pair!.asPascalCase);
            }
          }
        },
      ),
    );
  }
}
