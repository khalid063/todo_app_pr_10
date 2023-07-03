import 'package:flutter/material.dart';

TextStyle myTextStyle() {
  return const TextStyle(
      fontSize: 30, color: Colors.purple, fontWeight: FontWeight.w800);
}

InputDecoration myInputDecoretion(label){
  return InputDecoration(
    labelText: label,
    fillColor: Colors.cyanAccent,
    filled: true,
    border: const OutlineInputBorder(),
  );
}

ButtonStyle myElevatedButtonStyle(){
  return ElevatedButton.styleFrom(
    backgroundColor: Colors.red,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10))
    )
  );
}