import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  String photo_url;
  AvatarWidget(this.photo_url);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(photo_url),
    );
  }
}
