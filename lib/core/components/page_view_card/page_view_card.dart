import 'dart:async';

import 'package:flutter/material.dart';
import '../../extension/context_extension.dart';

class PageViewCard extends StatelessWidget {
  String emoji;
  String cardText;
  PageViewCard(this.emoji, this.cardText);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 0.01,
            blurRadius: 14,
            offset: Offset(0, 0.1), // changes position of shadow
          ),
        ],
        color: context.colors.background,
        borderRadius: BorderRadius.circular(30),
      ),
      margin: context.paddingLow,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(emoji, style: context.textTheme.headline6),
          Text(
            cardText,
            style: context.textTheme.subtitle2
                .copyWith(fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
