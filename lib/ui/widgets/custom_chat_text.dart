import 'package:flutter/material.dart';

class CustomChatText extends StatelessWidget {
  final String text;
  final String uid;
  AnimationController animationCtrl;
  
  CustomChatText({Key? key, this.text = '', this.uid = '123', required this.animationCtrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationCtrl,
      child: SizeTransition(
        sizeFactor: CurvedAnimation(parent: animationCtrl, curve: Curves.easeOut),
        child: Container(
          child: uid == '123' ? _myMessage() : _yourMessage(),
        ),
      ),
    );
  }

  Widget _myMessage() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(bottom: 5, left: 50, right: 5),
        padding: const EdgeInsets.all(10),
        child:  Text(text),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

  Widget _yourMessage() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 5, left: 5, right: 50),
        padding: const EdgeInsets.all(10),
        child:  Text(text),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
