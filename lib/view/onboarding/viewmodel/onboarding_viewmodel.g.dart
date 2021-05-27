// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$OnBoardingViewModel on _OnBoardingViewModelBase, Store {
  final _$currentIndexAtom =
      Atom(name: '_OnBoardingViewModelBase.currentIndex');

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  final _$_OnBoardingViewModelBaseActionController =
      ActionController(name: '_OnBoardingViewModelBase');

  @override
  dynamic incrementCurrentValue() {
    final _$actionInfo = _$_OnBoardingViewModelBaseActionController.startAction(
        name: '_OnBoardingViewModelBase.incrementCurrentValue');
    try {
      return super.incrementCurrentValue();
    } finally {
      _$_OnBoardingViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCurrentIndex(int value) {
    final _$actionInfo = _$_OnBoardingViewModelBaseActionController.startAction(
        name: '_OnBoardingViewModelBase.changeCurrentIndex');
    try {
      return super.changeCurrentIndex(value);
    } finally {
      _$_OnBoardingViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex}
    ''';
  }
}
