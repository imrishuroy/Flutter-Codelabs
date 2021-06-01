import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:friendly_chat/chat_messages.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final _messageController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isComposing = false;

  final List<ChatMessage> _messageList = [];

  @override
  void dispose() {
    for (var message in _messageList) {
      message.animationController?.dispose();
    }
    super.dispose();
  }

  _handleSubmitted(String text) {
    _messageController.clear();
    setState(() {
      _isComposing = false;
    });
    ChatMessage message = ChatMessage(
      text: text,
      animationController: AnimationController(
        vsync: this,
        duration: const Duration(
          milliseconds: 700,
        ),
      ),
    );
    setState(
      () {
        _messageList.insert(0, message);
      },
    );
    _focusNode.requestFocus();
    message.animationController?.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
        title: Text('Friendly Chat'),
      ),
      body: Container(
        decoration: Theme.of(context).platform == TargetPlatform.iOS // NEW
            ? BoxDecoration(
                // NEW
                border: Border(
                  // NEW
                  top: BorderSide(color: Colors.grey[200]!), // NEW
                ), // NEW
              ) // NEW
            : null,
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                reverse: true,
                itemCount: _messageList.length,
                padding: EdgeInsets.all(8.0),
                itemBuilder: (context, index) {
                  return _messageList[index];
                },
              ),
            ),
            Divider(height: 1.0),
            Container(
              decoration: BoxDecoration(color: Theme.of(context).cardColor), //,
              child: _buildTextComposer(),
            )
          ],
        ),
      ),
    );
  }

  Container _buildTextComposer() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _isComposing = value.isNotEmpty;
                });
              },
              onSubmitted: _isComposing ? _handleSubmitted : null,
              focusNode: _focusNode,
              controller: _messageController,
              decoration:
                  InputDecoration.collapsed(hintText: 'Enter a messsage'),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 4.0),
            child: Theme.of(context).platform == TargetPlatform.iOS
                ? // MODIFIED
                CupertinoButton(
                    // NEW
                    child: Text('Send'), // NEW
                    onPressed: _isComposing // NEW
                        ? () => _handleSubmitted(_messageController.text) // NEW
                        : null,
                  )
                : // NEW
                IconButton(
                    // MODIFIED
                    icon: const Icon(Icons.send),
                    onPressed: _isComposing
                        ? () => _handleSubmitted(_messageController.text)
                        : null,
                  ),
          )
        ],
      ),
    );
  }
}
