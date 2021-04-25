// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailViewModel on _DetailViewModelBase, Store {
  final _$initialPageAtom = Atom(name: '_DetailViewModelBase.initialPage');

  @override
  int get initialPage {
    _$initialPageAtom.reportRead();
    return super.initialPage;
  }

  @override
  set initialPage(int value) {
    _$initialPageAtom.reportWrite(value, super.initialPage, () {
      super.initialPage = value;
    });
  }

  final _$_DetailViewModelBaseActionController =
      ActionController(name: '_DetailViewModelBase');

  @override
  dynamic changeInitialPage(int value) {
    final _$actionInfo = _$_DetailViewModelBaseActionController.startAction(
        name: '_DetailViewModelBase.changeInitialPage');
    try {
      return super.changeInitialPage(value);
    } finally {
      _$_DetailViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
initialPage: ${initialPage}
    ''';
  }
}
