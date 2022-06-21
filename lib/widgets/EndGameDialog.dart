import 'package:flutter/material.dart';

AlertDialog CardImage({required path}){
  return Image(
    image: AssetImage(path),
    height: 110,
  );
}