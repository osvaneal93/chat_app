import 'package:flutter/material.dart';

Widget CustomSignUp (BuildContext context, String route, String texto1, String texto2) {
  
    return Center(
      child: Column(
        children: [
           Text(texto1),
          GestureDetector(
            child:  Text(texto2,
              style: const TextStyle(color: Colors.amber),
            ),
            onTap: (){
              Navigator.pushNamed(context,route);
            },
          ),
        ],
      ),
    );
  }