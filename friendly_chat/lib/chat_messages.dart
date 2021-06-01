import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String? text;

  const ChatMessage({Key? key, this.text, this.animationController})
      : super(key: key);
  final AnimationController? animationController;
  final String _name = 'Rishu';
  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: CurvedAnimation(
        curve: Curves.easeOut,
        parent: animationController!,
      ),
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: CircleAvatar(child: Text(_name[0])),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_name, style: Theme.of(context).textTheme.headline4),
                  Container(
                    margin: EdgeInsets.only(top: 5.0),
                    child: Text(text!),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
