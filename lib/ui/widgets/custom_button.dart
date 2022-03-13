
import 'package:flutter/material.dart';

class CustomEnterButton extends StatelessWidget {
  const CustomEnterButton({
    Key? key, this.onPressed, this.text = '',
  }) : super(key: key);
  final Function? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      onPressed: () {onPressed;
      },
      child: Text(text),
      style: ButtonStyle(
        shape:
            MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
