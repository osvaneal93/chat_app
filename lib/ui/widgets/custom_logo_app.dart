import 'package:flutter/material.dart';

 Widget Logo(String text) {
    return Center(
      child: Container(
        child: Column(
          children: [
            SizedBox(
              child: Image.asset('assets/logo1.png'),
              height: 200,
              width: 200,
            ),
             Text(
              text,
              style: const TextStyle(
                  fontSize: 30, color: Color.fromARGB(255, 220, 213, 10)),
            ),
          ],
        ),
      ),
    );
  }