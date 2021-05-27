import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../extension/string_extension.dart';

class AutoLocaleText extends StatelessWidget {
  final String value;
  final TextAlign? textAlign;
  final TextStyle? style;
  final int? maxLines;
  final TextOverflow? textOverflow;

  const AutoLocaleText(
      {Key? key,
      required this.value,
      this.textAlign,
      this.style,
      this.maxLines,
      this.textOverflow})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      value.locale,
      textAlign: textAlign,
      style: style,
      maxLines: maxLines ?? 2,
      overflow: textOverflow,
    );
  }
}
