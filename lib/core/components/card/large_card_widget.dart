import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:fluttermvvmtemplate/core/extension/context_extension.dart';

class LargeCardWidget extends StatelessWidget {
  final String text;
  final Widget child;
  final double left;
  final double top;
  final VoidCallback? onTap;
  const LargeCardWidget({
    Key? key,
    required this.text,
    required this.child,
    required this.left,
    required this.top,
    this.onTap,
  }) : super(key: key);

/* 
   top: context.mediaQuery.size.height * 0.570,
      left: context.mediaQuery.size.width * 0.06,
 */
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      child: GestureDetector(
        onTap: onTap,
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
          height: context.mediaQuery.size.height * 0.24,
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
      ),
    );
  }
}
