import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/extension/context_extension.dart';

class TextInputWidget extends StatelessWidget {
  String labelName;
  var controller = TextEditingController();
  var formKey = GlobalKey<FormState>();
  Function valid;

  TextInputWidget(this.labelName, this.controller);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        obscureText: false,
        controller: controller,
        decoration: InputDecoration(
            hoverColor: context.colors.background,
            fillColor: context.colors.background,
            filled: false,
            border: InputBorder.none,
            enabledBorder: UnderlineInputBorder(),
            focusColor: context.colors.background,
            focusedBorder: UnderlineInputBorder(),
            labelText: labelName,
            labelStyle: context.textTheme.bodyText1
                .copyWith(fontSize: 15, fontWeight: FontWeight.w500)),
      ),
    );
  }
}
