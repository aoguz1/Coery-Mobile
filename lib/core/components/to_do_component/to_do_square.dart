import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/extension/context_extension.dart';

class ToDoSquare extends StatelessWidget {
  Color colorValue;

  ToDoSquare(this.colorValue);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: colorValue,
            border: Border.all(
                width: 2, color: Colors.red, style: BorderStyle.solid)),
      ),
    );
  }
}
