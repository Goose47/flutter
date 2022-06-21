import 'package:flutter/material.dart';

Widget CardImage({required path}){
  return Image(
    image: AssetImage(path),
    height: 110,
  );
}