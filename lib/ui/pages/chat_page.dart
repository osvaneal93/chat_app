import 'dart:io';

import 'package:chat_app_/ui/widgets/custom_chat_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with TickerProviderStateMixin {
  final TextEditingController _textController = TextEditingController();

  final FocusNode _focusNode = FocusNode();

  bool _isWritting = false;
  List<CustomChatText> _chat = [];

  @override
  Widget build(BuildContext context) {
    final sizeDevice = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _appBar(),
      body: Container(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                itemCount: _chat.length,
                itemBuilder: (_, i) => _chat[i],
                reverse: true,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              width: sizeDevice.width,
              height: sizeDevice.height * .07,
              decoration: BoxDecoration(
                color: Colors.amber.shade200,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Flexible(
                    child: TextField(
                      onSubmitted: _handleSummit,
                      onChanged: (text) {
                        setState(() {
                          if (text.trim().isNotEmpty) {
                            _isWritting = true;
                          } else {
                            _isWritting = false;
                          }
                        });
                      },
                      controller: _textController,
                      decoration: const InputDecoration(
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                      focusNode: _focusNode,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Platform.isIOS
                        ? CupertinoButton(
                            child: const Text('Enviar'), onPressed: () {})
                        : Container(
                            child: IconTheme(
                              data: const IconThemeData(color: Colors.amber),
                              child: IconButton(
                                splashColor: Colors.transparent,
                                splashRadius: .01,
                                onPressed: (_isWritting)
                                    ? () => _handleSummit(
                                        _textController.text.trim())
                                    : null,
                                icon: const Icon(Icons.send),
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      centerTitle: true,
      title: Column(
        children: const [
          SizedBox(
            height: 3,
          ),
          CircleAvatar(child: Text('OS'), maxRadius: 14),
          SizedBox(
            height: 3,
          ),
          Text(
            'Osvaldo Marin',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    );
  }

  _handleSummit(String text) {
    if(text.isEmpty) return;
    print(text);
    _textController.clear();
    _focusNode.requestFocus();
    final newMessage = CustomChatText(
        uid: '123',
        text: text,
        animationCtrl: AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 600),
        ));
    _chat.insert(0, newMessage);
    newMessage.animationCtrl.forward();
    setState(() {
      _isWritting = false;
    });
  }
  @override
  void dispose() {
    for (CustomChatText message in _chat){
      message.animationCtrl.dispose();
    }
    super.dispose();
  }
}
