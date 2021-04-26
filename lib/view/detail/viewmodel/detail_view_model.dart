import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/base/model/base_view_model.dart';
import 'package:fluttermvvmtemplate/view/detail/view/detail_view.dart';
import 'package:mobx/mobx.dart';
part 'detail_view_model.g.dart';

class DetailViewModel = _DetailViewModelBase with _$DetailViewModel;

abstract class _DetailViewModelBase with Store, BaseViewModel {
  var book_name_text_controller = TextEditingController();
  var read_page_text_controller = TextEditingController();
  var controller = PageController(initialPage: 0, viewportFraction: 0.3);

  @observable
  int initialPage = 0;

  @action
  changeInitialPage(int value) {
    initialPage = value;
  }

  changePage() {
    switch (initialPage) {
      case 0:
        return SportDetailWidget();
        break;
      case 1:
        return WaterDetailWidget();
        break;
      case 2:
        return BookDetailWidget();
        break;
      case 3:
        return TodoDetailWidget();
        break;
      default:
    }
  }

  @override
  void setContext(BuildContext context) => this.context = context;
  void init() {}
}
