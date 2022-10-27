import 'package:flutter/material.dart';

//einheitliches Design für alle Eingabefelder

const textInputDecoration = InputDecoration(
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black12, width: 2.0)
  ),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black, width: 2.0)
  ),
);
