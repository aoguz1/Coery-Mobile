import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/base/model/base_view_model.dart';
import 'package:mobx/mobx.dart';
part 'detail_view_model.g.dart';

class DetailViewModel = _DetailViewModelBase with _$DetailViewModel;

abstract class _DetailViewModelBase with Store, BaseViewModel {
  var controller = PageController(initialPage: 1, viewportFraction: 0.3);

  @observable
  int initialPage = 1;

  @action
  changeInitialPage(int value) {
    initialPage = value;
  }

  @override
  void setContext(BuildContext context) => this.context = context;
  void init() {}
}
