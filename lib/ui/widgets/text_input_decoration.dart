import 'package:flutter/material.dart';

//einheitliches Design für alle Eingabefelder

const textInputDecoration = InputDecoration(
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black12, width: 2),
  ),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 2),
  ),
);
