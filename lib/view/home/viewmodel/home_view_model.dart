import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/base/model/base_error.dart';
import 'package:fluttermvvmtemplate/core/base/model/base_view_model.dart';
import 'package:fluttermvvmtemplate/view/home/view/home_view.dart';
import 'package:mobx/mobx.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  @observable
  DateTime date = DateTime.now();
  String? mount;
  @observable
  int selectedCard = 1;

  @observable
  double? touchedValue;

  @observable
  int sayi = 0;

  @action
  void increment() {
    sayi++;
    print(mount);
  }

  @action
  String getDate() {
    final dateParse = DateTime.parse(date.toString());
    switch (dateParse.month) {
      case 1:
        mount = 'Ocak';
        break;
      case 2:
        mount = 'Şubat';
        break;
      case 3:
        mount = 'Mart';
        break;
      case 4:
        mount = 'Nisan';
        break;
      case 5:
        mount = 'Mayıs';
        break;
      case 6:
        mount = 'Haziran';
        break;
      case 7:
        mount = 'Temmuz';
        break;
      case 8:
        mount = 'Ağustos';
        break;
      case 9:
        mount = 'Eylül';
        break;
      case 10:
        mount = 'Ekim';
        break;
      case 11:
        mount = 'Kasım';
        break;
      case 12:
        mount = 'Aralık';
        break;
      default:
    }
    final formattedDate = '${dateParse.day} ${mount} ${dateParse.year}';
    return formattedDate;
  }

  void changeDragbleScrollView(int value) {
    selectedCard = value;
  }

  Widget? changePage(ScrollController scrollController) {
    switch (selectedCard) {
      case 1:
        return TodoDragbleScrollViewBody(scrollController);
        break;
      case 2:
        return BookDragbleScrollViewBody(scrollController);
        break;
      case 3:
        return WaterDragbleScrollViewBody(scrollController);
        break;
      case 4:
        return SportDragbleScrollViewBody(scrollController);
        break;
      default:
    }
  }

  @override
  void setContext(BuildContext context) => this.context = context;
  void init() {
    touchedValue = -1;
  }
}
