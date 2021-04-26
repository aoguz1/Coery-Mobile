import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttermvvmtemplate/core/extension/context_extension.dart';

class WaterButton extends StatelessWidget {
  Function onPress;
  String assetPath;
  String waterSize;

  WaterButton(@required this.assetPath, @required this.waterSize,
      @required this.onPress);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 2,
          primary: context.colors.background,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
        ),
        onPressed: onPress,
        child: Container(
          alignment: Alignment.center,
          width: 70,
          height: 100,
          padding: context.paddingLow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(assetPath),
              Text(
                waterSize,
                style: context.textTheme.bodyText1,
              )
            ],
          ),
        ));
  }
}
