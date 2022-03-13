import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.sizeDevice,
    this.icon,
    this.placeholder,
    this.textController,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
  }) : super(key: key);

  final Size sizeDevice;
  final IconData? icon;
  final String? placeholder;
  final TextEditingController? textController;
  final TextInputType keyboardType;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20),
      margin: EdgeInsets.symmetric(
          horizontal: sizeDevice.width * .1, vertical: sizeDevice.width * .02),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                offset: Offset(2, 5),
                blurRadius: 5,
                spreadRadius: 1,
                color: Colors.grey.shade300),
          ]),
      child: TextField(
        obscureText: isPassword,
        controller: textController,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          prefixIcon: Icon(icon),
          hintText: placeholder,
        ),
      ),
    );
  }
}
