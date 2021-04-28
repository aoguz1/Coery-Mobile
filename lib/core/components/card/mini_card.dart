import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/extension/context_extension.dart';

class MiniCardWidget extends StatelessWidget {
  String text;
  Widget child;
  double right;
  double top;

  MiniCardWidget(
      {@required this.right,
      @required this.top,
      @required this.text,
      @required this.child});

/* 
     right: context.mediaQuery.size.height * 0.03,
      top: context.mediaQuery.size.height * 0.53,
 */
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: right,
      top: top,
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 0.01,
            blurRadius: 14,
            offset: Offset(0, 0.1), // changes position of shadow
          ),
        ], color: Colors.white, borderRadius: BorderRadius.circular(22)),
        width: context.mediaQuery.size.width * 0.42,
        height: context.mediaQuery.size.height * 0.20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: context.paddingNormal,
              child: Text(
                text,
                style: context.textTheme.bodyText1,
              ),
            ),
            child
          ],
        ),
      ),
    );
  }
}
