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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: context.colors.onPrimary,
        child: Icon(
          Icons.add,
          color: context.colors.background,
          size: 30,
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            child: Container(
              color: context.colors.primary,
            ),
            height: context.mediaQuery.size.height * 0.4,
          ),
          Container(
            padding: context.paddingMedium,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                  flex: 1,
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        _viewModel.getDate(),
                        style: context.textTheme.button
                            .copyWith(color: Color(ColorConstants.SILVER_RUST)),
                      )),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'İyi Günler Abdullah 🙌',
                        style: context.textTheme.headline5,
                      )),
                ),
                Spacer(
                  flex: 10,
                )
              ],
            ),
          ),
          Positioned(
            top: context.mediaQuery.size.height * 0.310,
            left: context.mediaQuery.size.width * 0.06,
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
                      '⏰ Yapılacaklar',
                      style: context.textTheme.bodyText1,
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: context.mediaQuery.size.height * 0.570,
            left: context.mediaQuery.size.width * 0.06,
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
                      '💦 Su',
                      style: context.textTheme.bodyText1,
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: context.mediaQuery.size.height * 0.03,
            top: context.mediaQuery.size.height * 0.310,
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
              padding: EdgeInsets.all(0),
              height: context.mediaQuery.size.height * 0.20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: context.paddingNormal,
                    child: Text('📕 ' + 'Kitap',
                        style: context.textTheme.bodyText1),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: context.mediaQuery.size.height * 0.03,
            top: context.mediaQuery.size.height * 0.53,
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
                      '💪 Spor',
                      style: context.textTheme.bodyText1,
                    ),
                  )
                ],
              ),
            ),
          ),
          DraggableScrollableSheet(
              initialChildSize: 0.165,
              minChildSize: 0.165,
              maxChildSize: 0.71,
              builder: (context, scrollController) {
                return Container(
                  child: ListView.builder(
                      controller: scrollController,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('index $index'),
                        );
                      }),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.4),
                          spreadRadius: 0.01,
                          blurRadius: 14,
                          offset: Offset(0, 0.1), // changes position of shadow
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                );
              })
        ],
      ),
    );
  }
}
