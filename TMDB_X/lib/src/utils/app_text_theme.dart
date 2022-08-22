import 'package:flutter/material.dart';

TextStyle AppBarText(){
  return const TextStyle(
      color: Colors.white,
      fontFamily: "Kanit",
      shadows: <Shadow>[
        Shadow(
          color: Colors.black,
          blurRadius: 10,
        )
      ]);
}

TextStyle HintTextInCard(){
  return const TextStyle(
      color: Colors.white38,
      fontSize: 14,
      letterSpacing: 2,
      fontFamily: "Kanit",
      shadows: <Shadow>[
        Shadow(
          color: Colors.black,
          blurRadius: 10,
        )
      ]);
}