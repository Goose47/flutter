import 'package:flutter/material.dart';

SnackBar PopUp({required message}) {
  return SnackBar(
    content: Container(
        padding: const EdgeInsets.all(16),
        height: 90,
        decoration: const BoxDecoration(
            color: Color(0xFFC72C41),
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white
                ),
              ),
            ]
        )
    ),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}