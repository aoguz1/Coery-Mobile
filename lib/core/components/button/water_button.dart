import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:fluttermvvmtemplate/core/extension/context_extension.dart';

class WaterButton extends StatelessWidget {
  final VoidCallback? onPress;
  final String assetPath;
  final String waterSize;
  const WaterButton({
    Key? key,
    required this.onPress,
    required this.assetPath,
    required this.waterSize,
  }) : super(key: key);

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
