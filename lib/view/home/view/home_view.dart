import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttermvvmtemplate/core/constants/app/color_constants.dart';
import 'package:fluttermvvmtemplate/core/extension/context_extension.dart';
import 'package:fluttermvvmtemplate/view/home/viewmodel/home_view_model.dart';

final HomeViewModel _viewModel = HomeViewModel();

class HomeView extends StatelessWidget {
  final profile_photo_url =
      'https://avatars.githubusercontent.com/u/34376691?v=4';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              padding: context.paddingMedium,
              width: double.infinity,
              decoration: BoxDecoration(color: context.colors.primary),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 1, child: SizedBox()),
                  Container(
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(profile_photo_url))),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          _viewModel.getDate(),
                          style: context.textTheme.button.copyWith(
                              color: Color(ColorConstants.SILVER_RUST)),
                        )),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'İyi Günler Abdullah 🙌',
                          style: context.textTheme.headline5,
                        )),
                  ),
                  Spacer(
                    flex: 2,
                  )
                ],
              ),
            ),
          ),
          Expanded(
              flex: 6,
              child: Stack(
                children: [
                  Positioned(
                      top: 20,
                      child: Row(
                        children: [
                          Container(
                            width: 200,
                            height: 200,
                            color: Colors.amber,
                          )
                        ],
                      ))
                ],
              ))
        ],
      ),
    );
  }
}
